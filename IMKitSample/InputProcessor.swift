//
//  InputHandler.swift
//  IMKitSample
//
//  Created by 강우현 on 12/1/25.
//

import Cocoa
import Foundation

protocol InputProcessor {
    var data: InputProcessorData { get }
    func getKeyAction (event: NSEvent, env: inout Environment) -> KeyAction?
}

class PlainInputProcessor: InputProcessor {
    let data = InputProcessorData()
    func getKeyAction(event: NSEvent, env: inout Environment) -> KeyAction? {
        return KeyAction.fromRawValue(0)
    }
}

class BasicInputProcessor: InputProcessor {
    var data: InputProcessorData
    
    init(data: InputProcessorData) {
        self.data = data
    }
    
    func getKeyAction(event: NSEvent, env: inout Environment) -> KeyAction? {
        let key = Key(event: event)
        var keyAction = KeyAction.normalCharacter(unicode: 0)
        
        // 단축 글쇠 처리 구현
        
        // delete + 글쇠배열 처리 (control, command 안 눌렀을 때만)
        if event.modifierFlags.contains(.control) {
            NSLog("Info: Key skipped --- control key is pressed")
            return nil
        } else if event.modifierFlags.contains(.command) {
            NSLog("Info: Key skipped --- command key is pressed")
            return nil
        }
        if key.keyCode == .delete {
            if !key.shift, !key.option {
                return KeyAction.specialKey(keyCode: 0x88)
            } else if key.shift, !key.option {
                return KeyAction.specialKey(keyCode: 0x89)
            } else if !key.shift, key.option {
                return KeyAction.specialKey(keyCode: 0x8A)
            } else if key.shift, key.option {
                return KeyAction.specialKey(keyCode: 0x8B)
            }
        } else if let expr = data.keyTable[key] {
            keyAction = KeyAction.fromRawValue(expr.eval(env: &env))
        }
        
        return keyAction
    }
}

class AdvancedInputProcessor: InputProcessor {
    var data: InputProcessorData
    
    init (data: InputProcessorData) {
        self.data = data
    }
    
    func getKeyAction(event: NSEvent, env: inout Environment) -> KeyAction? {
        let key = Key(event: event)
        var keyAction = KeyAction.normalCharacter(unicode: 0)
        
        // 고급 글쇠 처리 구현
        
        // 단축 글쇠 처리 구현
        
        // delete + 글쇠배열 처리 (control, command 안 눌렀을 때만)
        if event.modifierFlags.contains(.control) {
            NSLog("Info: Key skipped --- control key is pressed")
            return nil
        } else if event.modifierFlags.contains(.command) {
            NSLog("Info: Key skipped --- command key is pressed")
            return nil
        }
        if key.keyCode == .delete {
            if !key.shift, !key.option {
                return KeyAction.specialKey(keyCode: 0x88)
            } else if key.shift, !key.option {
                return KeyAction.specialKey(keyCode: 0x89)
            } else if !key.shift, key.option {
                return KeyAction.specialKey(keyCode: 0x8A)
            } else if key.shift, key.option {
                return KeyAction.specialKey(keyCode: 0x8B)
            }
        } else if let expr = data.keyTable[key] {
            keyAction = KeyAction.fromRawValue(expr.eval(env: &env))
        }
        
        return keyAction
    }
}
