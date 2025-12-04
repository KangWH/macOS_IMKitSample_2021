//
//  IMKitSampleInputController.swift
//  IMKitSampleInputController
//
//  Created by ensan on 2021/09/07.
//

import Cocoa
import InputMethodKit

let fallBackKeyboard = sebeolsik391

@objc(IMKitSampleInputController)
class IMKitSampleInputController: IMKInputController {
    var receiver = InputReceiver(fallBackKeyboard)
    
    // Empty these lists when generating release build
    var activeKeyboards: [Keyboard] = []
    
    override init!(server: IMKServer, delegate: Any!, client inputClient: Any) {
        super.init(server: server, delegate: delegate, client: inputClient)
        
        loadActiveKeyboards()
        setValue(0, forTag: 0, client: inputClient)
        
        if self.activeKeyboards.isEmpty {
            NSLog("Warning: Failed to load keyboards. Using \(fallBackKeyboard.name) instead.")
            do {
                try KeyboardFileManager.shared.save(keyboard: fallBackKeyboard)
                loadActiveKeyboards()
            } catch {
                activeKeyboards = [fallBackKeyboard]
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
        
        var keyboard: Keyboard = fallBackKeyboard
        if let activeKeyboardID = userDefaults.string(forKey: "ActiveKeyboardID") {
            keyboard = (activeKeyboards.first(where: { $0.id == activeKeyboardID })) ?? activeKeyboards.first ?? fallBackKeyboard
        } else {
            NSLog("Warning: Previous default value not found. Setting to first available keyboard.")
            keyboard = (activeKeyboards.first) ?? fallBackKeyboard
        }
        
        receiver = InputReceiver(keyboard)
//        receiver.keyboard = dubeolsikOld
        
        userDefaults.set(keyboard.id, forKey: "ActiveKeyboardID")
        NSLog("Info: Active keyboard set to \(keyboard.id).")
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
        case .keyUp:
            let handledResult = receiver.keyUpHandler(event, client: sender)
            return handledResult
        default:
            return false
        }
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
//    var keyboard: Keyboard
    var stateLog: [Int]
    var hangulBufferLog: [[PreSyllable]]
    var environment: Environment
    
    var inputProcessor: InputProcessor
    var outputProcessor: OutputProcessor
    
    var text: String = ""
    
    init(_ keyboard: Keyboard) {
        self.stateLog = []
        self.hangulBufferLog = []
        self.environment = [:]
        
        switch keyboard.inputLevel {
        case .plain:
            self.inputProcessor = PlainInputProcessor()
        case .basic:
            self.inputProcessor = BasicInputProcessor(data: keyboard.inputProcessorData)
        case .advanced:
            self.inputProcessor = AdvancedInputProcessor(data: keyboard.inputProcessorData)
        }
        
        switch keyboard.outputLevel {
        case .plain:
            self.outputProcessor = PlainOutputProcessor()
        case .basic:
            self.outputProcessor = BasicOutputProcessor(data: keyboard.outputProcessorData)
        case .advanced:
            // AdvancedOutputProcessor 만들면 고치세요
            self.outputProcessor = BasicOutputProcessor(data: keyboard.outputProcessorData)
        }
    }
    
    mutating func keyDownHandler(_ event: NSEvent, client sender: Any!) -> Bool {
        if type(of: self.inputProcessor) == PlainInputProcessor.self {
            return false
        }
        
        // 1. 입력기 전체 설정 처리
        // 1.1. 단축키
        
        // 일단은 특정 키는 바로 보내도록 함
        if [0x24, 0x30, 0x31].contains(event.keyCode) || (0x34 < event.keyCode && event.keyCode < 0x5D) || (0x5F < event.keyCode) {
            self.flush(sender)
            return false
        }
        if event.keyCode == 0x33 {
            if self.hangulBufferLog.isEmpty {
                return false
            } else {
                self.hangulBufferLog.removeLast()
                self.sendText(sender)
                self.stateLog.removeLast()
                return true
            }
        }
        
        
        /* 2. 입력 처리 */
        
        self.environment["A"] = 0 // 나중에 현재 글자판의 번호로 바꿀 것
        if let hangulBuffer = self.hangulBufferLog.last, let currentSyllable = hangulBuffer.last {
            self.environment["D"] = Int64(currentSyllable.leading.code)
            self.environment["E"] = Int64(currentSyllable.leading.code)
            self.environment["F"] = Int64(currentSyllable.leading.code)
        } else {
            self.environment["D"] = 0
            self.environment["E"] = 0
            self.environment["F"] = 0
        }
        self.environment["J"] = 0 // 연타 횟수로 바꿀 것
        self.environment["K"] = 0 // 현재 시각으로 바꿀 것 (ms)
        self.environment["N"] = 0
        self.environment["P"] = event.modifierFlags.contains(.capsLock) ? 1 : 0
        if self.inputProcessor.data.flags.contains(.useRandomNumber) {
            self.environment["R"] = Int64.random(in: Int64(Int32.min)...Int64(Int32.max))
        }
        self.environment["T"] = Int64(self.stateLog.last ?? 0)
        self.environment["V"] = 1 // 현재 눌린 키의 수
        self.environment["W"] = 1 // 눌린 키의 최댓값
        
        guard let keyAction = inputProcessor.getKeyAction(event: event, env: &self.environment) else {
            self.flush(sender)
            return false
        }
        
        
        /* 3. 출력 처리 */
        
        let processedText = self.outputProcessor.executeKeyAction(keyAction, hangulBufferLog: &self.hangulBufferLog, stateLog: &self.stateLog, env: &self.environment)
        
        if let text = processedText {
            if text != "" {
                self.flush(sender)
            }
            self.sendText(sender, text: text)
        } else {
            self.flush(sender)
        }
        
        // (특수글쇠일 때)             (한글 글쇠일 때)              (일반 글쇠일 때)
        // 3.1. 글쇠 처리             3.1. 낱자 결합 확인            3.1. 글쇠 치환 -> 성공 시 한글 글쇠인 경우 왼쪽 과정을 따라 처리
        //                          3.2. 가상 낱자 대응            3.2. 사용자 정의 조합
        //                          3.3. 종성에서 초성 넘겨주기       3.3. 사용자 정의 조합의 지정된 상태로 이동
        //                          3.4. 결합 축약
        //                          3.5. 음절 조합
        //                          3.6. 한글 음절 치환 -> 낱자 치환(단, 가상 낱자 변환 전을 기준으로)
        // 3.2. 오토마타 상태 전환       3.7. 오토마타 상태 전환
        
        return true
    }
    
    mutating func keyUpHandler(_ event: NSEvent, client sender: Any!) -> Bool {
        return false
    }
    
    func buildHangulSyllable() -> String {
        guard let hangulBuffer = self.hangulBufferLog.last else {
            return ""
        }
        let syllables = hangulBuffer.map {
            let leadingIndex = [0x0001, 0x0002, 0x000C, 0x0018, 0x001A, 0x0024, 0x0046, 0x0056, 0x005D, 0x006D, 0x0076, 0x008A, 0x00A1, 0x00A5, 0x00AB, 0x00B0, 0x00B1, 0x00B3, 0x00B9].firstIndex(of: $0.leading.code)
            let medialIndex = [0x0001, 0x0005, 0x0006, 0x000A, 0x000B, 0x000F, 0x0010, 0x0014, 0x0015, 0x0016, 0x0017, 0x0021, 0x0022, 0x002B, 0x002E, 0x0030, 0x0034, 0x0036, 0x0040, 0x0047, 0x0049].firstIndex(of: $0.medial.code)
            let trailingIndex = [0x0000, 0x0001, 0x0002, 0x0007, 0x000C, 0x0014, 0x0017, 0x0018, 0x0024, 0x0025, 0x002F, 0x0033, 0x003A, 0x0040, 0x0041, 0x0042, 0x0046, 0x0056, 0x005E, 0x006D, 0x0076, 0x008A, 0x00A1, 0x00AB, 0x00B0, 0x00B1, 0x00B3, 0x00B9].firstIndex(of: $0.trailing.code)
            if let leadingIndex = leadingIndex, let medialIndex = medialIndex, let trailingIndex = trailingIndex {
                let syllableUnicode = UnicodeScalar(0xAC00 + (21 * 28) * leadingIndex + 28 * medialIndex + trailingIndex)
                return String(Character(syllableUnicode!))
            }
            
            if let leadingJamoCode = LeadingJamoCode[$0.leading.code],
               let compatibilityJamoCode = LeadingToCompatibility[leadingJamoCode],
               $0.medial.code == 0, $0.trailing.code == 0 {
                let unicodeScalar = UnicodeScalar(compatibilityJamoCode)!
                return String(Character(unicodeScalar))
            }
            if let medialJamoCode = MedialJamoCode[$0.medial.code],
               let compatibilityJamoCode = MedialToCompatibility[medialJamoCode],
               $0.leading.code == 0, $0.trailing.code == 0 {
                let unicodeScalar = UnicodeScalar(compatibilityJamoCode)!
                return String(Character(unicodeScalar))
            }
            if let trailingJamoCode = TrailingJamoCode[$0.trailing.code],
               let compatibilityJamoCode = TrailingToCompatibility[trailingJamoCode],
               $0.leading.code == 0, $0.medial.code == 0 {
                let unicodeScalar = UnicodeScalar(compatibilityJamoCode)!
                return String(Character(unicodeScalar))
            }
            
            let leadingUnicodeScalar = UnicodeScalar(LeadingJamoCode[$0.leading.code] ?? 0x115F)
            let medialUnicodeScalar = UnicodeScalar(MedialJamoCode[$0.medial.code] ?? 0x1160)
            if $0.trailing.code != 0, let trailingJamoCode = TrailingJamoCode[$0.trailing.code] {
                let trailingUnicodeScalar = UnicodeScalar(trailingJamoCode)
                if let leadingUnicodeScalar = leadingUnicodeScalar, let medialUnicodeScalar = medialUnicodeScalar, let trailingUnicodeScalar = trailingUnicodeScalar {
                    return String(Character(leadingUnicodeScalar)) + String(Character(medialUnicodeScalar)) + String(Character(trailingUnicodeScalar))
                }
            } else {
                if let leadingUnicodeScalar = leadingUnicodeScalar, let medialUnicodeScalar = medialUnicodeScalar {
                    return String(Character(leadingUnicodeScalar)) + String(Character(medialUnicodeScalar))
                }
            }
            return ""
        }
        let string = syllables.joined()
        return string
    }
    
    mutating func flush(_ sender: Any!) {
        let string = self.buildHangulSyllable()
        self.hangulBufferLog.removeAll()
        self.stateLog.removeAll()
        self.environment.removeAll()
        self.sendText(sender, text: string)
    }
    
    mutating func sendText(_ sender: Any!, text: String = "") {
        guard let target = sender as? IMKTextInput else {
            return
        }
        
        let replacementRange = NSRange(location: NSNotFound, length: NSNotFound)
        target.insertText(text, replacementRange: replacementRange)
        if !self.stateLog.isEmpty {
            let composing = buildHangulSyllable()
            let selectRange = NSRange(location: 0, length: composing.count)
            target.setMarkedText(composing, selectionRange: selectRange, replacementRange: replacementRange)
        }
    }
}
