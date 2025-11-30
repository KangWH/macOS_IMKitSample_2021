//
//  LayoutView.swift
//  IMKitSample
//
//  Created by 강우현 on 11/26/25.
//

import SwiftUI

struct LayoutView: View {
    enum PhysicalLayout {
        case ansi
        case iso
        case jis
    }
    @State private var capsLockPressed: Bool = false
    @State private var optionPressed: Bool = false
    @State private var shiftPressed: Bool = false
    @State private var physicalLayout: PhysicalLayout = .ansi
    
    var body: some View {
        VStack {
            Form {
                Picker(selection: $physicalLayout, label: Text("Physical Layout")) {
                    Text("ANSI").tag(PhysicalLayout.ansi)
                    Text("ISO").tag(PhysicalLayout.iso)
                    Text("JIS").tag(PhysicalLayout.jis)
                }
            }
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    if physicalLayout == .ansi {
                        KeyView(keyName: "`", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                    } else if physicalLayout == .iso {
                        KeyView(keyName: "§", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                    }
                    if physicalLayout == .jis {
                        KeyView(keyName: "1", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~", widthFactor: 1.25)
                    } else {
                        KeyView(keyName: "1", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                    }
                    KeyView(keyName: "2", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                    KeyView(keyName: "3", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                    KeyView(keyName: "4", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                    KeyView(keyName: "5", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                    KeyView(keyName: "6", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                    KeyView(keyName: "7", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                    KeyView(keyName: "8", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                    KeyView(keyName: "9", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                    KeyView(keyName: "0", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                    KeyView(keyName: "-", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                    KeyView(keyName: "=", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                    if physicalLayout == .jis {
                        KeyView(keyName: "¥", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                        ModifierKeyView(direction: .trailing, modifier: .delete, widthFactor: 1.25)
                    } else {
                        ModifierKeyView(direction: .trailing, modifier: .delete, widthFactor: 1.5)
                    }
                }
                HStack(spacing: 0) {
                    if physicalLayout == .jis {
                        ModifierKeyView(direction: .leading, modifier: .tab)
                    } else {
                        ModifierKeyView(direction: .leading, modifier: .tab, widthFactor: 1.5)
                    }
                    KeyView(keyName: "Q", baseKey: "ㅂ", shiftKey: "ㅃ", optionKey: "q", optionShiftKey: "Q")
                    KeyView(keyName: "W", baseKey: "ㅈ", shiftKey: "ㅉ", optionKey: "w", optionShiftKey: "W")
                    KeyView(keyName: "E", baseKey: "ㅈ", shiftKey: "ㅉ", optionKey: "w", optionShiftKey: "W")
                    KeyView(keyName: "R", baseKey: "ㅈ", shiftKey: "ㅉ", optionKey: "w", optionShiftKey: "W")
                    KeyView(keyName: "T", baseKey: "ㅈ", shiftKey: "ㅉ", optionKey: "w", optionShiftKey: "W")
                    KeyView(keyName: "Y", baseKey: "ㅈ", shiftKey: "ㅉ", optionKey: "w", optionShiftKey: "W")
                    KeyView(keyName: "U", baseKey: "ㅈ", shiftKey: "ㅉ", optionKey: "w", optionShiftKey: "W")
                    KeyView(keyName: "I", baseKey: "ㅈ", shiftKey: "ㅉ", optionKey: "w", optionShiftKey: "W")
                    KeyView(keyName: "O", baseKey: "ㅈ", shiftKey: "ㅉ", optionKey: "w", optionShiftKey: "W")
                    KeyView(keyName: "P", baseKey: "ㅈ", shiftKey: "ㅉ", optionKey: "w", optionShiftKey: "W")
                    KeyView(keyName: "[", baseKey: "ㅈ", shiftKey: "ㅉ", optionKey: "w", optionShiftKey: "W")
                    KeyView(keyName: "]", baseKey: "ㅈ", shiftKey: "ㅉ", optionKey: "w", optionShiftKey: "W")
                    switch physicalLayout {
                    case .ansi:
                        KeyView(keyName: "\\", baseKey: "\\", shiftKey: "|", optionKey: "\\", optionShiftKey: "|")
                    case .iso:
                        ModifierKeyView(direction: .trailing, modifier: .return)
                    case .jis:
                        ModifierKeyView(direction: .trailing, modifier: .return, widthFactor: 1.5)
                    }
                }
                HStack(spacing: 0) {
                    if physicalLayout == .jis {
                        ModifierKeyView(direction: .leading, modifier: .control, widthFactor: 1.25)
                    } else {
                        ClickableModifierKeyView(direction: .leading, modifier: .capslock, widthFactor: 1.75, pressed: $capsLockPressed)
                    }
                    KeyView(keyName: "A", baseKey: "ㅁ", shiftKey: "ㅁ", optionKey: "a", optionShiftKey: "A")
                    KeyView(keyName: "S", baseKey: "ㅁ", shiftKey: "ㅁ", optionKey: "a", optionShiftKey: "A")
                    KeyView(keyName: "D", baseKey: "ㅁ", shiftKey: "ㅁ", optionKey: "a", optionShiftKey: "A")
                    KeyView(keyName: "F", baseKey: "ㅁ", shiftKey: "ㅁ", optionKey: "a", optionShiftKey: "A")
                    KeyView(keyName: "G", baseKey: "ㅁ", shiftKey: "ㅁ", optionKey: "a", optionShiftKey: "A")
                    KeyView(keyName: "H", baseKey: "ㅁ", shiftKey: "ㅁ", optionKey: "a", optionShiftKey: "A")
                    KeyView(keyName: "J", baseKey: "ㅁ", shiftKey: "ㅁ", optionKey: "a", optionShiftKey: "A")
                    KeyView(keyName: "K", baseKey: "ㅁ", shiftKey: "ㅁ", optionKey: "a", optionShiftKey: "A")
                    KeyView(keyName: "L", baseKey: "ㅁ", shiftKey: "ㅁ", optionKey: "a", optionShiftKey: "A")
                    KeyView(keyName: ";", baseKey: "ㅁ", shiftKey: "ㅁ", optionKey: "a", optionShiftKey: "A")
                    KeyView(keyName: "\"", baseKey: "ㅁ", shiftKey: "ㅁ", optionKey: "a", optionShiftKey: "A")
                    switch physicalLayout {
                    case .ansi:
                        ModifierKeyView(direction: .trailing, modifier: .return, widthFactor: 1.75)
                    case .iso:
                        KeyView(keyName: "\\", baseKey: "\\", shiftKey: "|", optionKey: "\\", optionShiftKey: "|")
                        KeyView(keyName: "", baseKey: "", shiftKey: "", optionKey: "", optionShiftKey: "", widthFactor: 0.75)
                    case .jis:
                        KeyView(keyName: "\\", baseKey: "\\", shiftKey: "|", optionKey: "\\", optionShiftKey: "|")
                        KeyView(keyName: "", baseKey: "", shiftKey: "", optionKey: "", optionShiftKey: "", widthFactor: 1.25)
                    }
                }
                HStack(spacing: 0) {
                    switch physicalLayout {
                    case .ansi:
                        ClickableModifierKeyView(direction: .leading, modifier: .shift, widthFactor: 2.25, pressed: $shiftPressed)
                    case .iso:
                        ClickableModifierKeyView(direction: .leading, modifier: .shift, widthFactor: 1.25, pressed: $shiftPressed)
                        KeyView(keyName: "`", baseKey: "`", shiftKey: "~", optionKey: "`", optionShiftKey: "~")
                    case .jis:
                        ClickableModifierKeyView(direction: .leading, modifier: .shift, widthFactor: 1.75, pressed: $shiftPressed)
                    }
                    KeyView(keyName: "Z", baseKey: "ㅋ", shiftKey: "", optionKey: "z", optionShiftKey: "z")
                    KeyView(keyName: "X", baseKey: "ㅋ", shiftKey: "", optionKey: "z", optionShiftKey: "z")
                    KeyView(keyName: "C", baseKey: "ㅋ", shiftKey: "", optionKey: "z", optionShiftKey: "z")
                    KeyView(keyName: "V", baseKey: "ㅋ", shiftKey: "", optionKey: "z", optionShiftKey: "z")
                    KeyView(keyName: "B", baseKey: "ㅋ", shiftKey: "", optionKey: "z", optionShiftKey: "z")
                    KeyView(keyName: "N", baseKey: "ㅋ", shiftKey: "", optionKey: "z", optionShiftKey: "z")
                    KeyView(keyName: "M", baseKey: "ㅋ", shiftKey: "", optionKey: "z", optionShiftKey: "z")
                    KeyView(keyName: ",", baseKey: "ㅋ", shiftKey: "", optionKey: "z", optionShiftKey: "z")
                    KeyView(keyName: ".", baseKey: "ㅋ", shiftKey: "", optionKey: "z", optionShiftKey: "z")
                    KeyView(keyName: "/", baseKey: "ㅋ", shiftKey: "", optionKey: "z", optionShiftKey: "z")
                    if physicalLayout == .jis {
                        KeyView(keyName: "_", baseKey: "_", shiftKey: "", optionKey: "", optionShiftKey: "")
                    }
                    ClickableModifierKeyView(direction: .trailing, modifier: .shift, widthFactor: physicalLayout == .jis ? 1.75 : 2.25, pressed: $shiftPressed)
                }
                HStack(spacing: 0) {
                    if physicalLayout == .jis {
                        ClickableModifierKeyView(direction: .leading, modifier: .capslock, pressed: $capsLockPressed)
                        ClickableModifierKeyView(direction: .leading, modifier: .option, pressed: $optionPressed)
                        ModifierKeyView(direction: .leading, modifier: .command, widthFactor: 1.25)
                        ModifierKeyView(direction: .leading, modifier: .eisu, widthFactor: 1.25)
                        KeyView(keyName: "", baseKey: "", shiftKey: "", optionKey: "", optionShiftKey: "", widthFactor: 3.5)
                        ModifierKeyView(direction: .trailing, modifier: .kana, widthFactor: 1.25)
                        ModifierKeyView(direction: .trailing, modifier: .command, widthFactor: 1.25)
                        ClickableModifierKeyView(direction: .trailing, modifier: .option, widthFactor: 2, pressed: $optionPressed)
                        ModifierKeyView(direction: .trailing, modifier: .control, widthFactor: 2)
                    } else {
                        ModifierKeyView(direction: .leading, modifier: .control, widthFactor: 1.5)
                        ClickableModifierKeyView(direction: .leading, modifier: .option, widthFactor: 1.25, pressed: $optionPressed)
                        ModifierKeyView(direction: .leading, modifier: .command, widthFactor: 1.5)
                        KeyView(keyName: "", baseKey: "", shiftKey: "", optionKey: "", optionShiftKey: "", widthFactor: 6)
                        ModifierKeyView(direction: .trailing, modifier: .command, widthFactor: 1.5)
                        ClickableModifierKeyView(direction: .trailing, modifier: .option, widthFactor: 1.25, pressed: $optionPressed)
                        ModifierKeyView(direction: .trailing, modifier: .control, widthFactor: 1.5)
                    }
                }
            }
            HStack {
                Spacer()
                MenuButton(label: Text("Load preset")) {
                    Text("Dubeolsik")
                    Text("Dubeolsik old Hangul")
                    Text("Sebeolsik 3-90")
                    Text("Sebeolsik 3-91")
                    Text("Sebeolsik no-shift")
                    Text("Sebeolsik old Hangul")
                }
                Button("Export") {}
            }
            .frame(width: 870)
        }
        .navigationTitle("Edit layout")
    }
}

#Preview {
    LayoutView()
}
