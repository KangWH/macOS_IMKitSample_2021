//
//  IMKitSampleInputController.swift
//  IMKitSampleInputController
//
//  Created by ensan on 2021/09/07.
//

import Cocoa
import InputMethodKit

@objc(IMKitSampleInputController)
class IMKitSampleInputController: IMKInputController {
    var receiver = InputReceiver(dubeolsikOld)
    
    // Empty these lists when generating release build
    var activeKeyboards: [Keyboard] = []
    
    override init!(server: IMKServer, delegate: Any!, client inputClient: Any) {
        super.init(server: server, delegate: delegate, client: inputClient)
        
        loadActiveKeyboards()
        setValue(0, forTag: 0, client: inputClient)
        
        if self.activeKeyboards.isEmpty {
            NSLog("Warning: Failed to load keyboards. Using dubeolsik instead.")
            do {
                try KeyboardFileManager.shared.save(keyboard: dubeolsik)
                loadActiveKeyboards()
            } catch {
                activeKeyboards = [dubeolsik]
                NSLog("Error: Failed to save default keyboard. \(error.localizedDescription)")
            }
        } else {
            NSLog("Info: Keyboard list loaded: \(self.activeKeyboards.map({$0.id}).joined(separator: ", ")).")
        }
        selectActiveKeyboard()
        
    }
    
    func loadActiveKeyboards() {
        activeKeyboards = []
        let keyboardList = KeyboardFileManager.shared.loadUserKeyboardsList()
        for id in keyboardList {
            let keyboard = KeyboardFileManager.shared.loadUserKeyboard(from: id)
            guard let keyboard = keyboard else { continue }
            activeKeyboards.append(keyboard)
        }
    }
    func selectActiveKeyboard() {
        guard let userDefaults = UserDefaults.shared else {
            NSLog("Error: Failed to access UserDefaults container.")
            return
        }
        
        if let activeKeyboardID = userDefaults.string(forKey: "ActiveKeyboardID") {
            receiver.keyboard = (activeKeyboards.first(where: { $0.id == activeKeyboardID })) ?? activeKeyboards.first ?? dubeolsik
        } else {
            NSLog("Warning: Previous default value not found. Setting to first available keyboard.")
            receiver.keyboard = (activeKeyboards.first) ?? dubeolsik
        }
        
//        receiver.keyboard = dubeolsikOld
        
        userDefaults.set(receiver.keyboard.id, forKey: "ActiveKeyboardID")
        NSLog("Info: Active keyboard set to \(receiver.keyboard.id).")
    }
    
    override open func activateServer(_ sender: Any!) {
        super.activateServer(sender)
        // TODO
    }
    override open func deactivateServer(_ sender: Any!) {
        super.deactivateServer(sender)
        // TODO
    }
    
    override open func handle(_ event: NSEvent!, client sender: Any!) -> Bool {
        switch (event.type) {
        case .keyDown:
            let handledResult = receiver.keyDownHandler(event, client: sender)
            return handledResult
        default:
            break
        }
        return false
    }
    
    override open func recognizedEvents(_ sender: Any!) -> Int {
        return Int(NSEvent.EventTypeMask(arrayLiteral: .keyDown, .flagsChanged,
            .leftMouseUp, .rightMouseUp, .leftMouseDown, .rightMouseDown,
            .leftMouseDragged, .rightMouseDragged,
            .appKitDefined, .applicationDefined, .systemDefined).rawValue)
    }
    
    override open func mouseDown(onCharacterIndex index: Int, coordinate point: NSPoint, withModifier flags: Int, continueTracking keepTracking: UnsafeMutablePointer<ObjCBool>!, client sender: Any!) -> Bool {
        self.receiver.flush(sender)
        return false
    }
    
    override open func menu() -> NSMenu! {
        let mainMenu = NSMenu(title: "Preferences")
        
        let settingsItem = NSMenuItem(title: "Preferences", action: #selector(openPreferencesWindow), keyEquivalent: "")
        settingsItem.target = self
        mainMenu.addItem(settingsItem)
        
        return mainMenu
    }
    @objc func openPreferencesWindow(_ sender: Any?) {
        let bundleIdentifier = "com.WoohyunKang.HaneulIMESettings"
        if let appURL = NSWorkspace.shared.urlForApplication(withBundleIdentifier: bundleIdentifier) {
            NSWorkspace.shared.open(appURL)
        } else {
            print("설정 앱을 찾을 수 없습니다.")
        }
    }
    
    // Idunnno
    override func setValue(_ value: Any, forTag tag: Int, client sender: Any) {
        if let client = sender as? (IMKTextInput & IMKUnicodeTextInput) {
            NSLog("French")
            client.overrideKeyboard(withKeyboardNamed: "com.apple.keylayouts.French")
        }
    }
}

struct InputReceiver {
    var keyboard: Keyboard
    var status: Int
    var compositionResult: Bool
    var keyBuffer: [Key]
    var charBuffer: [String]
    var hangulBuffer: [Hangul]
    var automataStateHistory: [Int]
    
    init(_ keyboard: Keyboard) {
        self.keyboard = keyboard
        self.status = -1 // -1: 조합 중이 아님, 0: 한글 조합 완료, 1 이상: 한글 조합 중
        self.compositionResult = false
        self.keyBuffer = []
        self.charBuffer = []
        self.hangulBuffer = []
        self.automataStateHistory = []
    }
    
    mutating func keyDownHandler(_ event: NSEvent, client sender: Any!) -> Bool {
        let flags = event.modifierFlags
        
        if flags.contains(.command) || flags.contains(.control) {
            NSLog("Key skipped: \(flags.contains(.command) ? "Command" : "Control") key is pressed.")
            self.flush(sender)
            return false
        }
        
        // delete, return 처리
        if event.keyCode == 0x33 {
            // delete
            guard !self.hangulBuffer.isEmpty else {
                return false
            }
            
            // 조합된 글자의 경우, 원래 문자열로 되돌리기
            if self.hangulBuffer.count > 0 {
                for (key, value) in self.keyboard.compositionRules {
                    if value != self.hangulBuffer.last! {
                        continue
                    }
                    // 입력 기록에 따라 더 엄밀한 처리 필요
                    NSLog("Reverted to \(key.map { $0.getCharacterString() }.joined(separator: "+"))")
                    self.hangulBuffer.removeLast()
                    key.forEach { self.hangulBuffer.append($0.copy()) }
                    break
                }
            }
            
            self.status = self.automataStateHistory.last ?? -1
            self.hangulBuffer.removeLast()
            self.charBuffer.removeLast()
            self.keyBuffer.removeLast()
            self.automataStateHistory.removeLast()
            self.sendText(sender)
            return true
        }
        
        // 입력기에서 처리하지 않는 키들
        guard KeyCode(rawValue: event.keyCode) != nil else {
            NSLog("Key skipped: No action found for key \(String(describing: event.keyCode)).")
            self.flush(sender)
            return false
        }
        
        let key = Key(event: event)
        self.keyBuffer.append(key)
        guard let action = self.getAction(event: event) else {
            NSLog("Key skipped: No action found for key \(String(describing: KeyCode(rawValue: event.keyCode))).")
            self.flush(sender)
            return false
        }
        
        // 키에 지정된 동작 실행 -> 함수로 보낼 것
        switch action {
        case .insert(let text):
            self.charBuffer.append(text)
            self.flush(sender)
            return true
            
        case .insertHangul(let hangul):
            // 마지막 글자, 마지막에서 두 번째 글자
            let hangul1 = hangul.copy()
            let hangul2: Hangul? = self.hangulBuffer.last
            
            // 두벌식에서 종성 다음에 중성이 입력된 경우 마지막 종성을 초성으로 처리 (겹받침으로 변환된 경우 역변환 필요)
            if let hangul2 = hangul2,
               hangul2.position == .final,
               hangul1.position == .medial {
                // 특수한 배열을 사용하여, 겹받침을 두 종성의 결합으로 입력하지 않은 경우도 생각해야 함 (아직은 안 함)
                for (key, value) in self.keyboard.compositionRules {
                    if value != hangul2 {
                        continue
                    }
                    NSLog("Reverted to \(key.map { $0.getCharacterString() }.joined(separator: "+"))")
                    if !key.last!.isTwoSet {
                        break
                    }
                    self.hangulBuffer.removeLast()
                    key.forEach { self.hangulBuffer.append($0.copy()) }
                    self.hangulBuffer.last!.position = .initial
                    break
                }
                
                hangul2.position = .initial
                // 초성을 입력한 것처럼 오토마타 상태 변환
                if let rules: [Condition: Int] = keyboard.automata[self.status] {
                    if let testResult = rules.first(where: { (condition, _) in condition.test(automataState: self.status, capsLockState: flags.contains(.capsLock), currentHangulPosition: .initial) }) {
                        self.status = testResult.value
                    } else {
                        self.status = 0
                    }
                } else {
                    self.status = 0
                }
            }
            
            self.hangulBuffer.append(hangul1)
            self.compositionResult = self.applyComposition() // 조합 적용
            
            // 겹받침 조합 실패한 두벌식 종성 초성으로 처리
            if !self.compositionResult, self.hangulBuffer.count > 1 {
                let hangul2: Hangul = self.hangulBuffer[self.hangulBuffer.count - 2]
                if hangul2.position == .final, hangul1.position == .final {
                    NSLog("Current jongseong \(hangul1.getCharacterString()) could not be composed")
                    hangul1.position = .initial
                }
            }
            
            // 오토마타 상태 설정 -> 함수로 보낼 것
            if let rules: [Condition: Int] = keyboard.automata[self.status] {
                if let testResult = rules.first(where: { (condition, _) in condition.test(automataState: self.status, capsLockState: flags.contains(.capsLock), currentHangulPosition: hangul1.position) }) {
                    self.status = testResult.value
                } else {
                    self.status = 0
                }
            } else {
                self.status = 0
            }
            self.automataStateHistory.append(self.status)
            NSLog("Current letter position: \(String(describing: self.hangulBuffer.last!.position)), Current automata state: \(self.status)")
            self.sendText(sender)
            return true
            
        case .noop(let stopComposition):
            if stopComposition {
                self.status = 0
                self.sendText(sender)
            }
            return true
            
        default:
            self.flush(sender)
            break
        }
        
        return false
    }
    func getAction(event: NSEvent) -> KeyAction? {
        guard let value = self.keyboard.layout.first(where: { (key, _) in key.test(event: event) }) else {
            print("nil!")
            return nil
        }
        let actionDictionary = value.value
        
        let capsLockPressed = event.modifierFlags.contains(.capsLock)
        for (condition, action) in actionDictionary {
            if condition.test(automataState: self.status, capsLockState: capsLockPressed) {
                return action
            }
        }
        
        return nil
    }
    func actionHandler(_ action: KeyAction) -> Bool {
        return false
    }
    
    mutating func applyComposition() -> Bool {
        // 조합 데이터가 없는 경우: 바로 실패
        guard self.keyboard.compositionRules.count > 0 else {
            return false
        }
        
        var currentCount = Array(self.keyboard.compositionRules.keys).max(by: { $0.count < $1.count })!.count
        while (currentCount > 1) {
            // 입력된 문자열이 짧은 경우: 실패
            guard self.hangulBuffer.count >= currentCount else {
                currentCount -= 1
                continue
            }
            let target = Array(self.hangulBuffer[(self.hangulBuffer.count - currentCount)...])
            for (key, value) in self.keyboard.compositionRules {
                if key.count != currentCount {
                    continue
                }
                if key == target {
                    // 조합 성공
                    self.hangulBuffer.removeLast(currentCount)
                    self.hangulBuffer.append(value)
                    return true
                }
            }
            currentCount -= 1
        }
        
        return false
    }
    
    mutating func flush(_ sender: Any!) {
        self.status = -1
        self.sendText(sender)
        self.compositionResult = false
        self.keyBuffer.removeAll()
        self.charBuffer.removeAll()
        self.hangulBuffer.removeAll()
        self.automataStateHistory.removeAll()
    }
    
    mutating func sendText(_ sender: Any!) {
        guard let target = sender as? IMKTextInput else {
            return
        }
        if (self.status < 0) {
            let string = self.charBuffer.joined()
            target.insertText(string, replacementRange: NSRange(location: NSNotFound, length: NSNotFound))
        } else {
            let string = self.hangulToString()
            target.setMarkedText(string, selectionRange: NSRange(location: 0, length: string.count), replacementRange: NSRange(location: NSNotFound, length: NSNotFound))
            self.charBuffer = [string]
        }
    }
    
    func hangulToString() -> String {
        let input = self.hangulBuffer
        var output = ""
        
        var currentInitial = Hangul(.initial, .none)
        var currentMedial = Hangul(.medial, .none)
        var currentFinal = Hangul(.final, .none)
        var currentToneMark = Hangul(.toneMark, .none)
        
        var i = 0
        while (i < input.count) {
            let currentPosition = input[i].position
            
            currentInitial = Hangul(.initial, .none)
            currentMedial = Hangul(.medial, .none)
            currentFinal = Hangul(.final, .none)
            currentToneMark = Hangul(.toneMark, .none)
            
            switch currentPosition {
            case .initial:
                currentInitial = input[i]
                if i + 1 < input.count, input[i + 1].position == .medial {
                    i += 1
                    currentMedial = input[i]
                    if i + 1 < input.count, input[i + 1].position == .final {
                        i += 1
                        currentFinal = input[i]
                    }
                }
                if i + 1 < input.count, input[i + 1].position == .toneMark {
                    i += 1
                    currentToneMark = input[i]
                }
            case .medial:
                currentMedial = input[i]
                if i + 1 < input.count, input[i + 1].position == .final {
                    i += 1
                    currentFinal = input[i]
                }
                if i + 1 < input.count, input[i + 1].position == .toneMark {
                    i += 1
                    currentToneMark = input[i]
                }
            case .final:
                currentFinal = input[i]
                if i + 1 < input.count, input[i + 1].position == .toneMark {
                    i += 1
                    fallthrough
                }
            case .toneMark:
                currentToneMark = input[i]
            case .compatibility:
                output += input[i].getCharacterString()
                if i + 1 < input.count, input[i + 1].position == .toneMark {
                    i += 1
                    if input[i].getUnicode() != 0 {
                        output += currentFinal.getCharacterString()
                    }
                }
                i += 1
                continue
            }
            
            if 0x1100 <= currentInitial.getUnicode(), currentInitial.getUnicode() <= 0x1112, 0x1160 < currentMedial.getUnicode(), currentMedial.getUnicode() <= 0x1175, currentFinal.getUnicode() <= 0x11C2 {
                // 현대 한글 음절자
                let initialIndex = currentInitial.getUnicode() - 0x1100
                let medialIndex = currentMedial.getUnicode() - 0x1161
                let finalIndex = currentFinal.getUnicode() == 0 ? 0 : (currentFinal.getUnicode() - 0x11A7)
                
                let unicode: unichar = 0xAC00 + initialIndex * 21 * 28 + medialIndex * 28 + finalIndex
                let character = Character(UnicodeScalar(unicode)!)
                let string = String(character)
                
                output += string
            } else if Array(currentInitial.compatibility.keys).contains(currentInitial.name) && currentMedial.name == .none && currentFinal.name == .none {
                // 초성 단독 표현
                output += Hangul(unicode: currentInitial.compatibility[currentInitial.name]!).getCharacterString()
            } else if currentInitial.name == .none && Array(currentMedial.compatibility.keys).contains(currentMedial.name) && currentFinal.name == .none {
                // 중성 단독 표현
                output += Hangul(unicode: currentMedial.compatibility[currentMedial.name]!).getCharacterString()
            } else if currentInitial.name == .none && currentMedial.name == .none && Array(currentFinal.compatibility.keys).contains(currentFinal.name) {
                // 종성 단독 표현
                output += Hangul(unicode: currentFinal.compatibility[currentFinal.name]!).getCharacterString()
            } else {
                output += currentInitial.getCharacterString()
                output += currentMedial.getCharacterString()
                if currentFinal.getUnicode() != 0 {
                    output += currentFinal.getCharacterString()
                }
            }
            
            if currentToneMark.getUnicode() != 0 {
                output += currentToneMark.getCharacterString()
            }
            
            i += 1
        }
        return output
    }
}
