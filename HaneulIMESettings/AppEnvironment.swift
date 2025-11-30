//
//  AppEnvironment.swift
//  HaneulIMESettings
//
//  Created by 강우현 on 11/29/25.
//

import Foundation
import Combine

@Observable class AppEnvironment: ObservableObject {
    var keyboards: [Keyboard]
    var oldHangulMethod: OldHangulMethod = .standard
    var processingUnit: ProcessingUnit = .word
    
    enum OldHangulMethod {
        case standard
        case PUA
    }
    enum ProcessingUnit {
        case word
        case syllable
    }
    
    private let fm = KeyboardFileManager.shared
    
    init() {
        keyboards = []
        let keyboards = fm.loadUserKeyboardsList()
        for id in keyboards {
            if let keyboard = fm.loadUserKeyboard(from: id) {
                self.keyboards.append(keyboard)
            }
        }
    }
    
    func save() {
        
    }
    
    func add() {
        
    }
    
    func remove(identifier: String) {
        
    }
}
