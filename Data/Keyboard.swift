//
//  Keyboard.swift
//  IMKitSample
//
//  Created by 강우현 on 11/25/25.
//

import Foundation
import AppKit

class Condition: Hashable, Equatable, Codable {
    // 각 조건을 모두 만족해야 함
    var allowedAutomataStates: [Int]?
    var onCapsLock: Bool?
    var lastInitial: Hangul.Name?
    var lastMedial: Hangul.Name?
    var lastFinal: Hangul.Name?
    var lastHangulPosition: Hangul.Position?
    var compositionResult: Bool?
    
    init(allowedAutomataStates: [Int]? = nil, onCapsLock: Bool? = nil, lastInitial: Hangul.Name? = nil, lastMedial: Hangul.Name? = nil, lastFinal: Hangul.Name? = nil, lastHangulPosition: Hangul.Position? = nil, compositionResult: Bool? = nil) {
        self.allowedAutomataStates = allowedAutomataStates
        self.onCapsLock = onCapsLock
        self.lastInitial = lastInitial
        self.lastMedial = lastMedial
        self.lastFinal = lastFinal
        self.lastHangulPosition = lastHangulPosition
        self.compositionResult = compositionResult
    }
    
    static func == (lhs: Condition, rhs: Condition) -> Bool {
        return lhs.allowedAutomataStates == rhs.allowedAutomataStates
            && lhs.onCapsLock == rhs.onCapsLock
            && lhs.lastInitial == rhs.lastInitial
            && lhs.lastMedial == rhs.lastMedial
            && lhs.lastFinal == rhs.lastFinal
            && lhs.lastHangulPosition == rhs.lastHangulPosition
            && lhs.compositionResult == rhs.compositionResult
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.allowedAutomataStates)
        hasher.combine(self.onCapsLock)
        hasher.combine(self.lastInitial)
        hasher.combine(self.lastMedial)
        hasher.combine(self.lastFinal)
        hasher.combine(self.lastHangulPosition)
        hasher.combine(self.compositionResult)
    }
    
    func test(automataState: Int, capsLockState: Bool, currentInitial: Hangul.Name? = nil, currentMedial: Hangul.Name? = nil, currentFinal: Hangul.Name? = nil, currentHangulPosition: Hangul.Position? = nil, currentCompositionResult: Bool? = nil) -> Bool {
        if let allowedAutomataStates = allowedAutomataStates, !allowedAutomataStates.contains(automataState) && !(allowedAutomataStates.contains(0) && automataState == -1) {
            return false
        }
        if let onCapsLock = onCapsLock, onCapsLock != capsLockState {
            return false
        }
        if let lastInitial = self.lastInitial, let currentInitial = currentInitial, lastInitial != currentInitial {
            return false
        }
        if let lastMedial = self.lastMedial, let currentMedial = currentMedial, lastMedial != currentMedial {
            return false
        }
        if let lastFinal = self.lastFinal, let currentFinal = currentFinal, lastFinal != currentFinal {
            return false
        }
        if let lastHangulPosition = self.lastHangulPosition, let currentHangulPosition = currentHangulPosition, lastHangulPosition != currentHangulPosition {
            return false
        }
        if let compositionResult = self.compositionResult, let currentCompositionResult = currentCompositionResult, compositionResult != currentCompositionResult {
            return false
        }
        return true
    }
}

struct Key: Hashable, Equatable, Codable {
    var keyCode: KeyCode
    var shift: Bool?
    var option: Bool?
    
    init(keyCode: KeyCode, shift: Bool? = nil, option: Bool? = nil) {
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
        switch (self.shift, self.option) {
        case (.some(let shift), .some(let option)):
            return event.modifierFlags.contains(.shift) == shift && event.modifierFlags.contains(.option) == option
        case (.some(let shift), .none): return event.modifierFlags.contains(.shift) == shift
        case (.none, .some(let option)): return event.modifierFlags.contains(.option) == option
        case (.none, .none): return true
        }
    }
}

enum KeyAction: Codable, Hashable, Equatable {
    case insert(String)
    case insertHangul(Hangul)
    case delete(direction: Direction)
    case transition(to: Int)
    case moveCursor(direction: Direction)
    case convert
    case noop(stopComposition: Bool)
    
    enum Position: Codable {
        case isolated
        case initial
        case medial
        case final
        case toneMark
    }
    enum Direction: Codable {
        case foreward
        case backward
    }
    
    enum CodingKeys: String, CodingKey {
        case actionType
        case character
        case unicode
        case isTwoSet
        case direction
        case to
        case stopComposition
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .insert(let character):
            try container.encode("insert", forKey: .actionType)
            try container.encode(character, forKey: .character)
        case .insertHangul(let hangul):
            try container.encode("insertHangul", forKey: .actionType)
            try container.encode(String(format: "0x%04X", hangul.getUnicode()), forKey: .unicode)
            try container.encode(hangul.isTwoSet, forKey: .isTwoSet)
        case .delete(direction: let direction):
            try container.encode("delete", forKey: .actionType)
            try container.encode(direction, forKey: .direction)
        case .transition(to: let to):
            try container.encode("transition", forKey: .actionType)
            try container.encode(to, forKey: .to)
        case .moveCursor(direction: let direction):
            try container.encode("moveCursor", forKey: .actionType)
            try container.encode(direction, forKey: .direction)
        case .convert:
            try container.encode("convert", forKey: .actionType)
        case .noop(stopComposition: let stopComposition):
            try container.encode("noop", forKey: .actionType)
            try container.encode(stopComposition, forKey: .stopComposition)
        }
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let type = try container.decode(String.self, forKey: .actionType)
        switch type {
        case "insert":
            let character = try container.decode(String.self, forKey: .character)
            self = .insert(character)
        case "insertHangul":
            let unicodeString = try container.decode(String.self, forKey: .unicode)
            guard let unicodeValue = unichar(unicodeString.replacingOccurrences(of: "0x", with: ""), radix: 16) else {
                throw DecodingError.dataCorruptedError(forKey: .unicode, in: container, debugDescription: "Invalid unicode format")
            }
            let isTwoSet = try container.decode(Bool.self, forKey: .isTwoSet)
            let hangul = Hangul(unicode: unicodeValue, isTwoSet: isTwoSet)
            self = .insertHangul(hangul)
        case "delete":
            let direction = try container.decode(String.self, forKey: .direction)
            switch direction {
            case "forward":
                self = .delete(direction: .foreward)
            case "backward":
                self = .delete(direction: .backward)
            default:
                throw DecodingError.dataCorruptedError(forKey: .direction, in: container, debugDescription: "Unknown Direction")
            }
        case "transition":
            let state = try container.decode(Int.self, forKey: .to)
            self = .transition(to: state)
        case "convert":
            self = .convert
        case "noop":
            let stopComposition = try container.decode(Bool.self, forKey: .stopComposition)
            self = .noop(stopComposition: stopComposition)
        default:
            throw DecodingError.dataCorruptedError(forKey: .actionType, in: container, debugDescription: "Unknown ActionType")
        }
    }
}

@Observable class Keyboard: Codable, Identifiable, Hashable, Equatable {
    enum HangulRange: Codable {
        case ksx1001        // KS X 1001에 있는 2350자
        case modernFull     // 현대 한글 음절 11172자 전체
        case hanyangPUA     // 현대 한글 + 한양 PUA 5299자
        case oldFull        // 가능한 모든 옛한글 음절 포함
    }
    
    var id: String
    var name: String
    var description: String
    var layout: [Key: [Condition: KeyAction]]
    var compositionRules: [[Hangul]: Hangul]
    var automata: [Int: [Condition: Int]]
    var hangulRange: HangulRange  // 구성을 허용할 한글 음절자의 범위.
    
    static func == (lhs: Keyboard, rhs: Keyboard) -> Bool {
        return lhs.id == rhs.id
    }
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    init(id: String, name: String, description: String, layout: [Key: [Condition: KeyAction]], compositionRules: [[Hangul]: Hangul], automata: [Int: [Condition: Int]], hangulRange: HangulRange) {
        self.id = id
        self.name = name
        self.description = description
        self.layout = layout
        self.compositionRules = compositionRules
        self.automata = automata
        self.hangulRange = hangulRange
    }
}
