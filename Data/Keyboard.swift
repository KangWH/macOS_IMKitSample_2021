//
//  Keyboard.swift
//  IMKitSample
//
//  Created by 강우현 on 11/25/25.
//

import Foundation
import AppKit


/* INPUT PROCESSOR OBJECT */

struct Key: Hashable, Equatable, Codable {
    var keyCode: KeyCode
    var shift: Bool
    var option: Bool
    
    init(keyCode: KeyCode, shift: Bool = false, option: Bool = false) {
        self.keyCode = keyCode
        self.shift = shift
        self.option = option
    }
    init(event: NSEvent) {
        self.keyCode = KeyCode(rawValue: event.keyCode) ?? KeyCode.a
        self.shift = event.modifierFlags.contains(.shift)
        self.option = event.modifierFlags.contains(.option)
    }
    
    static func == (lhs: Key, rhs: Key) -> Bool {
        return lhs.keyCode == rhs.keyCode && lhs.shift == rhs.shift && lhs.option == rhs.option
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.keyCode)
        hasher.combine(self.shift)
        hasher.combine(self.option)
    }
    
    func test(event: NSEvent) -> Bool {
        guard let keyCode = KeyCode(rawValue: event.keyCode), keyCode == self.keyCode else { return false }
        return self.shift == event.modifierFlags.contains(.shift) && self.option == event.modifierFlags.contains(.option)
    }
}
struct ShortcutKey: Hashable, Equatable, Codable {
    var keyCode: KeyCode
    var control: ModifierCondition
    var option: ModifierCondition
    var shift: ModifierCondition
    var command: ModifierCondition
    
    enum ModifierCondition: Codable {
        case none
        case left
        case right
        case any
    }
}
enum KeyAction: Equatable, Codable {
    case normalCharacter(unicode: Int32)
    case multipleCharacter(Int16, Int16, Int16)
    case dubeolsikHangul(leading: Int16, medial: Int16, trailing: Int16)
    case dubeolsikJongseongHangul(leading: Int16, medial: Int16, trailing: Int16)
    case sebeolsikHangul(leading: Int16, medial: Int16, trailing: Int16)
    case sebeolsikMTLHangul(leading: Int16, medial: Int16, trailing: Int16)
    case sebeolsikTLMHangul(leading: Int16, medial: Int16, trailing: Int16)
    case specialKey(keyCode: Int32)
    case keyPress(keyCode: Int16, control: Bool, option: Bool, shift: Bool, command: Bool)
    case automataState(to: Int32)
    
    static func fromRawValue(_ rawValue: Int64) -> KeyAction {
        let typeInteger = rawValue >> 48
        let entry1 = Int16(rawValue & 0xFFFF)
        let entry2 = Int16((rawValue & 0xFFFF0000) >> 16)
        let entry3 = Int16((rawValue & 0xFFFF00000000) >> 32)
        
        switch typeInteger {
        case 0x00:
            return .normalCharacter(unicode: Int32(rawValue & 0x10FFFF))
        case 0x01:
            return .sebeolsikHangul(leading: entry1, medial: entry2, trailing: entry3)
        case 0x02:
            return .dubeolsikHangul(leading: entry1, medial: entry2, trailing: entry3)
        case 0x03:
            return .specialKey(keyCode: Int32(rawValue & 0xFFFFFFFF))
        case 0x05:
            return .multipleCharacter(entry1, entry2, entry3)
        case 0x06:
            return .sebeolsikMTLHangul(leading: entry1, medial: entry2, trailing: entry3)
        case 0x07:
            return .sebeolsikTLMHangul(leading: entry1, medial: entry2, trailing: entry3)
        case 0x08:
            return .automataState(to: Int32(rawValue & 0xFFFFFFFF))
        case 0x09:
            let control = (rawValue & 0x00010000 != 0)
            let option = (rawValue & 0x00100000 != 0)
            let shift = (rawValue & 0x01000000 != 0)
            let command = (rawValue & 0x10000000 != 0)
            return .keyPress(keyCode: entry1, control: control, option: option, shift: shift, command: command)
        case 0x10:
            return .dubeolsikJongseongHangul(leading: entry1, medial: entry2, trailing: entry3)
        default:
            return .normalCharacter(unicode: 0)
        }
    }
    
    var previewString: String {
        switch self {
        case .normalCharacter(unicode: let unicode):
            if unicode == 0 { return "" }
            guard let unicodeScalar = UnicodeScalar(Int(unicode)) else {
                return "?"
            }
            return String(unicodeScalar)
            
        case .dubeolsikHangul(leading: let leading, medial: let medial, trailing: let trailing),
             .sebeolsikHangul(leading: let leading, medial: let medial, trailing: let trailing):
            if let leadingCode = LeadingJamoCode[leading], let unicodeScalar = UnicodeScalar(leadingCode) {
                return String(unicodeScalar)
            } else if let medialCode = MedialJamoCode[medial], let unicodeScalar = UnicodeScalar(medialCode) {
                return String(unicodeScalar)
            } else if let trailingCode = TrailingJamoCode[trailing], let unicodeScalar = UnicodeScalar(trailingCode) {
                return String(unicodeScalar)
            }
            return "?"
            
        default:
            return "?"
        }
    }
}
struct InputProcessorData: Codable {
    var flags: [InputProcessorFlag] = []
    var additionalExpressions = AdditionalExpressions()
    
    var keyTable: [Key: String] = [:]
    var keyTableDescription: String = ""
    var additionalKeyTable: [ShortcutKey: Expression] = [:]
    
    var advancedKeyInput: [Key: Int] = [:] // TODO [키 코드: (누를 때 조건, 누를 때 방식, 변수, 식, 뗄 때 방식, 변수, 식)]
    var normalKeyPrefixExpression: Expression? = nil
    var advancedKeyPrefixExpression: Expression? = nil
    
    enum InputProcessorFlag: Codable {
        case markAsSpecial
        case plainInputProcessorCompatible // Windows 호환 옵션
        case considerNonHangulComposingState
        case allowAssignmentToStateVariable
        case considerScrollLockState
        
        case useRandomNumber
    }
    struct AdditionalExpressions: Codable {
        var prefixExpression: Expression? = nil
        var postfixExpression: Expression? = nil
        var onAppLaunch: Expression? = nil
        var onFocus: Expression? = nil
        var onKeyboardSwitch: Expression? = nil
        var onComposingEnd: Expression? = nil
        var onInputStopped: Expression? = nil
    }
}


/* OUTPUT PROCESSOR OBJECT */

enum DeleteKeyAction: Codable {
    case byWhetherComposing(deletingUnit: DeletingUnit)
    case byContinuousInput(deletingUnit: DeletingUnit)
    case byExpression(deletingUnit: Expression)
    
    enum DeletingUnit: Codable {
        case key
        case leastSignificantKey
        case leastSignificantJamo
        case syllable
        case word
    }
}
struct CompositionRule: Codable {
    var syncLeadingAndTrailing: Bool = false
    var leading: [[Jamo]: Jamo] = [:]
    var medial: [[Jamo]: Jamo] = [:]
    var trailing: [[Jamo]: Jamo] = [:]
}
struct VirtualJamoRule: Codable {
    var syncLeadingAndTrailing: Bool = false
    var leading: [Jamo: Jamo] = [:]
    var medial: [Jamo: Jamo] = [:]
    var trailing: [Jamo: Jamo] = [:]
}
typealias TrailingToLeadingRule = [Jamo: [Jamo]]
struct DecompositionSkipRule: Codable {
    var leading: [Jamo: [Jamo]] = [:]
    var medial: [Jamo: [Jamo]] = [:]
    var trailing: [Jamo: [Jamo]] = [:]
}
struct AutomataEntry: Codable {
    var expression: String
    var fallbackState = 0
    var description: String = ""
}
struct OutputProcessorData: Codable {
    var flags: [OutputProcessorFlag] = []
    
    var deleteKeyRules: [DeleteKeyAction] = [] // TODO
    var composableSyllableRange: SyllableRange = .modernFull
    var timerRules: [String]? = nil
    var privateCandidates: [String: String] = [:] // TODO [원문: (치환, 설명)]
    
    var compositionRules = CompositionRule() // 초성, 중성, 종성 각각 [(한글 자모, 한글 자모): 한글 자모]
    var virtualJamoRules = VirtualJamoRule() // 초성, 중성, 종성 각각 [한글 자모: 한글 자모]
    var trailingToLeadingRules = TrailingToLeadingRule() // [종성: (종성, 초성?, 초성)]
    var decompositionSkipRules = DecompositionSkipRule() // 초성, 중성, 종성 각각 [한글 자모: (한글 자모, 한글 자모)]
    var automataRules: [Int: AutomataEntry] = [:]
    
    var privateCompositionRules: [Int: String] = [:] // TODO [상태: [키: (새 상태, 입력, 조합)]]
    var syllableSubstitution: [String: String] = [:] // TODO
    var jamoSubstitution: [String: String] = [:] // TODO
    
    enum OutputProcessorFlag: Codable {
        case doNotApplyFinalConversion
    }
    enum SyllableRange: Codable {
        case ksx1001        // KS X 1001에 있는 2350자
        case modernFull     // 현대 한글 음절 11172자 전체
        case hanyangPUA     // 현대 한글 + 한양 PUA 5299자
        case oldFull        // 가능한 모든 옛한글 음절 포함
    }
}


/* MAIN OBJECT */

@Observable class Keyboard: Codable, Identifiable, Hashable, Equatable {
    var id: String
    var name: String
    var description: String
    
    // 각각 '입력 스키마', '문자 생성기'에 대응
    var inputLevel: Level
    var outputLevel: Level
    enum Level: Codable {
        case plain
        case basic
        case advanced
    }
    
    var inputProcessorData: InputProcessorData
    var outputProcessorData: OutputProcessorData
    
    static func == (lhs: Keyboard, rhs: Keyboard) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    init(id: String, name: String, description: String, inputLevel: Level, outputLevel: Level, inputProcessorData: InputProcessorData, outputProcessorData: OutputProcessorData) {
        self.id = id
        self.name = name
        self.description = description
        
        self.inputLevel = inputLevel
        self.outputLevel = outputLevel
        
        self.inputProcessorData = inputProcessorData
        self.outputProcessorData = outputProcessorData
    }
}
