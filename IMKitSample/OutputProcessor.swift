//
//  OutputProcessor.swift
//  IMKitSample
//
//  Created by 강우현 on 12/1/25.
//

import Foundation

protocol OutputProcessor {
    var data: OutputProcessorData { get }
    ///
    func executeKeyAction(_ action: KeyAction, hangulBufferLog: inout [[PreSyllable]], stateLog: inout [Int], env: inout Environment) -> String?
    func changeState(state: Int) -> Int
    func changeState(state: Int, failState: Int64, inputJamos: [Jamo], currentSyllable: PreSyllable?, env: inout Environment) -> Int
}

class PlainOutputProcessor: OutputProcessor {
    var data = OutputProcessorData()
    
    func executeKeyAction(_ action: KeyAction, hangulBufferLog: inout [[PreSyllable]], stateLog: inout [Int], env: inout Environment) -> String? {
        switch action {
        case .normalCharacter(unicode: let unicode):
            if let unicodeScalar = UnicodeScalar(Int(unicode)) {
                return String(Character(unicodeScalar))
            }
            
        case .multipleCharacter(let unicode1, let unicode2, let unicode3):
            var string = ""
            let arr = [unicode1, unicode2, unicode3]
            for unicode in arr {
                if let unicodeScalar = UnicodeScalar(Int(unicode)) {
                    string += String(Character(unicodeScalar))
                }
            }
            return string
            
        case .dubeolsikHangul(leading: let leading, medial: let medial, trailing: let trailing),
             .dubeolsikJongseongHangul(leading: let leading, medial: let medial, trailing: let trailing),
             .sebeolsikHangul(leading: let leading, medial: let medial, trailing: let trailing):
            if let leadingJamoCode = LeadingJamoCode[leading] {
                if let compatibilityJamoCode = LeadingToCompatibility[leadingJamoCode],
                   let unicodeScalar = UnicodeScalar(compatibilityJamoCode) {
                    return String(Character(unicodeScalar))
                } else if let unicodeScalar = UnicodeScalar(leadingJamoCode),
                          let fillerUnicodeScalar = UnicodeScalar(0x1160) {
                    return String(Character(unicodeScalar)) + String(Character(fillerUnicodeScalar))
                }
            }
            if let medialJamoCode = MedialJamoCode[medial] {
               if let compatibilityJamoCode = MedialToCompatibility[medialJamoCode],
                  let unicodeScalar = UnicodeScalar(compatibilityJamoCode) {
                   return String(Character(unicodeScalar))
               } else if let unicodeScalar = UnicodeScalar(medialJamoCode),
                         let fillerUnicodeScalar = UnicodeScalar(0x115F) {
                   return String(Character(fillerUnicodeScalar)) + String(Character(unicodeScalar))
               }
            }
            if let trailingJamoCode = TrailingJamoCode[trailing] {
               if let compatibilityJamoCode = TrailingToCompatibility[trailingJamoCode],
                  let unicodeScalar = UnicodeScalar(compatibilityJamoCode) {
                   return String(Character(unicodeScalar))
               } else if let unicodeScalar = UnicodeScalar(trailingJamoCode),
                         let fillerUnicodeScalar = UnicodeScalar(0x115F),
                         let fillerUnicodeScalar2 = UnicodeScalar(0x1160) {
                   return String(Character(fillerUnicodeScalar)) + String(Character(fillerUnicodeScalar2)) + String(Character(unicodeScalar))
               }
            }
            
        case .sebeolsikTLMHangul(leading: let leading, medial: let medial, trailing: let trailing):
            break
            // TODO
            
        case .sebeolsikMTLHangul(leading: let leading, medial: let medial, trailing: let trailing):
            break
            // TODO
            
        case .keyPress(keyCode: _, control: _, option: _, shift: _, command: _):
            NSLog("Warning: Currently sending custom key event is not supported.")
            return nil
            
        case .automataState(to: _):
            return nil
            
        case .specialKey(keyCode: _):
            // TODO
            return nil
        }
        return ""
    }
    
    /// It will be unused, and the state will kept to be zero.
    func changeState(state: Int) -> Int {
        return 0
    }
    func changeState(state: Int, failState: Int64, inputJamos: [Jamo], currentSyllable: PreSyllable?, env: inout Environment) -> Int {
        return 0
    }
}

class BasicOutputProcessor: OutputProcessor {
    var data: OutputProcessorData
    
    init(data: OutputProcessorData) {
        self.data = data
    }
    
    func executeKeyAction(_ action: KeyAction, hangulBufferLog: inout [[PreSyllable]], stateLog: inout [Int], env: inout Environment) -> String? {
        switch action {
        case .normalCharacter(unicode: let unicode):
            if let unicodeScalar = UnicodeScalar(Int(unicode)) {
                return String(Character(unicodeScalar))
            }
            
        case .multipleCharacter(let unicode1, let unicode2, let unicode3):
            var string = ""
            let arr = [unicode1, unicode2, unicode3]
            for unicode in arr {
                if let unicodeScalar = UnicodeScalar(Int(unicode)) {
                    string += String(Character(unicodeScalar))
                }
            }
            return string
            
        case .dubeolsikHangul(leading: let leading, medial: let medial, trailing: let trailing):
            var inputJamos: [Jamo] = []
            if leading != 0 { inputJamos.append(Jamo(code: leading, pos: .leading, key: .dubeolsik)) }
            if medial != 0 { inputJamos.append(Jamo(code: medial, pos: .medial, key: .dubeolsik)) }
            if trailing != 0 { inputJamos.append(Jamo(code: trailing, pos: .trailing, key: .dubeolsik)) }
            
            self.processJamo(inputJamos: inputJamos, hangulBufferLog: &hangulBufferLog, stateLog: &stateLog, env: &env)
            return ""
            
        case .dubeolsikJongseongHangul(leading: let leading, medial: let medial, trailing: let trailing):
            var inputJamos: [Jamo] = []
            if leading != 0 { inputJamos.append(Jamo(code: leading, pos: .leading, key: .dubeolsikTrailingOnly)) }
            if medial != 0 { inputJamos.append(Jamo(code: medial, pos: .medial, key: .dubeolsikTrailingOnly)) }
            if trailing != 0 { inputJamos.append(Jamo(code: trailing, pos: .trailing, key: .dubeolsikTrailingOnly)) }
            
            self.processJamo(inputJamos: inputJamos, hangulBufferLog: &hangulBufferLog, stateLog: &stateLog, env: &env)
            return ""
        
        case .sebeolsikHangul(leading: let leading, medial: let medial, trailing: let trailing):
            var inputJamos: [Jamo] = []
            if leading != 0 { inputJamos.append(Jamo(code: leading, pos: .leading, key: .sebeolsik)) }
            if medial != 0 { inputJamos.append(Jamo(code: medial, pos: .medial, key: .sebeolsik)) }
            if trailing != 0 { inputJamos.append(Jamo(code: trailing, pos: .trailing, key: .sebeolsik)) }
            
            self.processJamo(inputJamos: inputJamos, hangulBufferLog: &hangulBufferLog, stateLog: &stateLog, env: &env)
            return ""
            
        case .sebeolsikTLMHangul(leading: let leading, medial: let medial, trailing: let trailing):
            var inputJamos: [Jamo] = []
            if trailing != 0 { inputJamos.append(Jamo(code: trailing, pos: .trailing, key: .sebeolsik)) }
            if leading != 0 { inputJamos.append(Jamo(code: leading, pos: .leading, key: .sebeolsik)) }
            if medial != 0 { inputJamos.append(Jamo(code: medial, pos: .medial, key: .sebeolsik)) }
            
            self.processJamo(inputJamos: inputJamos, hangulBufferLog: &hangulBufferLog, stateLog: &stateLog, env: &env)
            return ""
            
        case .sebeolsikMTLHangul(leading: let leading, medial: let medial, trailing: let trailing):
            var inputJamos: [Jamo] = []
            if medial != 0 { inputJamos.append(Jamo(code: medial, pos: .medial, key: .sebeolsik)) }
            if trailing != 0 { inputJamos.append(Jamo(code: trailing, pos: .trailing, key: .sebeolsik)) }
            if leading != 0 { inputJamos.append(Jamo(code: leading, pos: .leading, key: .sebeolsik)) }
            
            self.processJamo(inputJamos: inputJamos, hangulBufferLog: &hangulBufferLog, stateLog: &stateLog, env: &env)
            return ""
            
        case .keyPress(keyCode: _, control: _, option: _, shift: _, command: _):
            NSLog("Warning: Currently sending custom key event is not supported.")
            return nil
            
        case .automataState(to: _):
            return nil
            
        case .specialKey(keyCode: _):
            // TODO
            return nil
        }
        return ""
    }
    
    func processJamo(inputJamos: [Jamo], hangulBufferLog: inout [[PreSyllable]], stateLog: inout [Int], env: inout Environment, rerunCount: Int = 0) {
        var currentBuffer: [PreSyllable] = []
        if let lastBuffer = hangulBufferLog.last {
            lastBuffer.forEach { currentBuffer.append($0.copy()) }
        }
        if currentBuffer.isEmpty {
            currentBuffer.append(PreSyllable())
        }
        let currentSyllable = currentBuffer.last!
        
        if rerunCount > 100 { return } // Prevent infinite loop
        
        NSLog(hangulBufferLog.map {
            $0.map {
                String(format: "0x%04X 0x%04X 0x%04X", $0.leading.code, $0.medial.code, $0.trailing.code)
            }.joined(separator: "; ")
        }.joined(separator: "\n"))
        
        let newState = self.changeState(state: rerunCount > 0 ? 0 : (stateLog.last ?? 0), failState: 0, inputJamos: inputJamos, currentSyllable: currentSyllable, env: &env)
        // 오토마타 계산 결과 <= 0 -> 조합 불가
        if newState <= 0 {
            print("Info: processFailedJamo called; nonpositive automata result")
            self.processFailedJamo(failState: 1, inputJamos: inputJamos, hangulBufferLog: &hangulBufferLog, stateLog: &stateLog, env: &env, rerunCount: rerunCount)
            return
        }
        
        // 조합
        for jamo in inputJamos {
            var targetJamo: Jamo
            let targetRules: [[Jamo]: Jamo]
            switch jamo.position {
            case .leading:
                targetJamo = currentSyllable.leading
                targetRules = self.data.compositionRules.leading
            case .medial:
                targetJamo = currentSyllable.medial
                targetRules = self.data.compositionRules.medial
            case .trailing:
                targetJamo = currentSyllable.trailing
                targetRules = self.data.compositionRules.trailing
            }
            if targetJamo.code == 0 {
                // 현재 음절의 자리가 빈 경우
                targetJamo.code = jamo.code
                targetJamo.keySet = jamo.keySet
            } else {
                // 현재 음절의 자리에 낱자가 이미 있는 경우: 조합 시도
                let predicate = [targetJamo, jamo]
                if let result = targetRules[predicate] {
                    targetJamo.code = result.code
                    targetJamo.keySet = result.keySet
                } else {
                    print("Info: processFailedJamo called; composition failed")
                    self.processFailedJamo(failState: 1, inputJamos: inputJamos, hangulBufferLog: &hangulBufferLog, stateLog: &stateLog, env: &env, rerunCount: rerunCount)
                    return
                }
            }
        }
        
        // 음절 조합 처리
        if ([currentSyllable.leading.code, currentSyllable.medial.code, currentSyllable.trailing.code].count(where: { $0 == 0 }) < 2) {
            let syllableCompositionResult = self.composeSyllable(currentSyllable: currentSyllable)
            if syllableCompositionResult != 0 {
                print("Info: processFailedJamo called; syllable composition failed")
                processFailedJamo(failState: syllableCompositionResult, inputJamos: inputJamos, hangulBufferLog: &hangulBufferLog, stateLog: &stateLog, env: &env, rerunCount: rerunCount)
                return
            }
        }
        
        if rerunCount > 0 {
            hangulBufferLog.removeLast()
            stateLog.removeLast()
        }
        
        stateLog.append(newState)
        currentBuffer.removeLast()
        currentBuffer.append(currentSyllable)
        hangulBufferLog.append(currentBuffer)
    }
    func processFailedJamo(failState: Int64, inputJamos: [Jamo], hangulBufferLog: inout [[PreSyllable]], stateLog: inout [Int], env: inout Environment, rerunCount: Int) {
        var currentBuffer: [PreSyllable] = []
        if let lastBuffer = hangulBufferLog.last {
            lastBuffer.forEach { currentBuffer.append($0.copy()) }
        }
        if currentBuffer.isEmpty {
            currentBuffer.append(PreSyllable())
        }
        let currentSyllable = currentBuffer.last!
        
        let failedAction = self.changeState(state: stateLog.last ?? 0, failState: failState, inputJamos: inputJamos, currentSyllable: currentSyllable, env: &env)
        switch failedAction {
        case -1: break
        case -2: break
        case -3: break
        case -4: break
        case -5: break
        case -6: break
        case -7: break
        case -8: break
        case -9: break
        case -10: break
        case -11: break
        case -12: break
            
        default:
            let newSyllable = PreSyllable()
            /* 종성을 초성으로 */
            // 1. 현재 키의 첫 번째 동작이 중성 입력이어야 함
            let currentInputCondition = inputJamos[0].position == .medial && inputJamos[0].keySet == .dubeolsik
            // 2. 직전 입력은 종성이어야 함
            let previousSyllableCondition = currentSyllable.trailing.code != 0 && currentSyllable.trailing.keySet == .dubeolsik
            // 3. 전 글자의 종성이 없거나 현 종성과 다른 글자여야 함 (= 종성이 직전에 입력되었어야 함)
            let finalInputCondition = hangulBufferLog.count < 2 || hangulBufferLog[hangulBufferLog.count - 2].isEmpty || hangulBufferLog[hangulBufferLog.count - 2].count != currentBuffer.count || hangulBufferLog[hangulBufferLog.count - 2].last!.trailing.code != currentSyllable.trailing.code
            print(currentInputCondition, previousSyllableCondition, finalInputCondition)
            if currentInputCondition, previousSyllableCondition, finalInputCondition {
                newSyllable.leading.code = currentSyllable.trailing.code
                if currentSyllable.medial.code == 0 {
                    // 이미 결합 실패하여 종성만 남은 경우
                    print("flag1")
                    currentBuffer.removeLast()
                } else {
                    print("flag2")
                    // 받침을 당겨오는 경우
                    if hangulBufferLog.count >= 2,
                       let operand = hangulBufferLog[hangulBufferLog.count - 2].last,
                       let rule = self.data.compositionRules.trailing.first(where: { (key, value) in
                           key[0] == operand.trailing && value == currentSyllable.trailing
                       }) {
                        print("flag2.1")
                        let trailing = rule.key[0]
                        let leading = rule.key[1]
                        currentSyllable.trailing.code = trailing.code
                        currentSyllable.trailing.keySet = trailing.keySet
                        newSyllable.leading.code = leading.code
                        newSyllable.leading.keySet = leading.keySet
                    } else {
                        currentSyllable.trailing.code = 0
                    }
                }
            }
            currentBuffer.append(newSyllable)
            hangulBufferLog.append(currentBuffer)
            stateLog.append(0)
            processJamo(inputJamos: inputJamos, hangulBufferLog: &hangulBufferLog, stateLog: &stateLog, env: &env, rerunCount: rerunCount + 1)
            return
        }
    }
    func composeSyllable(currentSyllable: PreSyllable) -> Int64 {
        let leadingIndex = [0x0001, 0x0002, 0x000C, 0x0018, 0x001A, 0x0024, 0x0046, 0x0056, 0x005D, 0x006D, 0x0076, 0x008A, 0x00A1, 0x00A5, 0x00AB, 0x00B0, 0x00B1, 0x00B3, 0x00B9].firstIndex(of: currentSyllable.leading.code)
        let medialIndex = [0x0001, 0x0005, 0x0006, 0x000A, 0x000B, 0x000F, 0x0010, 0x0014, 0x0015, 0x0016, 0x0017, 0x0021, 0x0022, 0x002B, 0x002E, 0x0030, 0x0034, 0x0036, 0x0040, 0x0047, 0x0049].firstIndex(of: currentSyllable.medial.code)
        let trailingIndex = [0x0000, 0x0001, 0x0002, 0x0007, 0x000C, 0x0014, 0x0017, 0x0018, 0x0024, 0x0025, 0x002F, 0x0033, 0x003A, 0x0040, 0x0041, 0x0042, 0x0046, 0x0056, 0x005E, 0x006D, 0x0076, 0x008A, 0x00A1, 0x00AB, 0x00B0, 0x00B1, 0x00B3, 0x00B9].firstIndex(of: currentSyllable.trailing.code)
        
        if let leadingIndex = leadingIndex, let medialIndex = medialIndex, let trailingIndex = trailingIndex {
            let syllableUnicode = UnicodeScalar(0xAC00 + (21 * 28) * leadingIndex + 28 * medialIndex + trailingIndex)
        }
        
        switch self.data.composableSyllableRange {
        case .modernFull:
            if leadingIndex == nil || medialIndex == nil || trailingIndex == nil {
                return 2
            }
            return 0
            
        default: return 0
        }
    }
    
    // 일반 문자 입력 시
    func changeState(state: Int) -> Int {
        guard let automataEntry = self.data.automataRules[state] else {
            return 0
        }
        return automataEntry.fallbackState
    }
    // 한글 조합 시
    func changeState(state: Int, failState: Int64, inputJamos: [Jamo], currentSyllable: PreSyllable?, env: inout Environment) -> Int {
        if inputJamos.isEmpty {
            return state
        }
        
        ["A", "B", "C", "D", "E", "F", "I", "J", "K"].forEach { env[$0] = 0 }
        for jamo in inputJamos {
            switch jamo.position {
            case .leading:
                env[failState == 0 ? "A" : "I"] = Int64(jamo.code)
            case .medial:
                env[failState == 0 ? "B" : "J"] = Int64(jamo.code)
            case .trailing:
                env[failState == 0 ? "C" : "K"] = Int64(jamo.code)
            }
        }
        if let currentSyllable = currentSyllable {
            env["D"] = Int64(currentSyllable.leading.code)
            env["E"] = Int64(currentSyllable.medial.code)
            env["F"] = Int64(currentSyllable.trailing.code)
        }
        if failState == 2 {
            // L, M, N 지정
        }
        // O 지정
        env["T"] = failState
        
        guard let expr = data.automataRules[state] else {
            return 0
        }
        return Int(expr.expression.eval(env: &env))
    }
}
