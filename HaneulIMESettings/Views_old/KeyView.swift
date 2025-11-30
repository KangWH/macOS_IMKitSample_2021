//
//  KeyView.swift
//  IMKitSample
//
//  Created by 강우현 on 11/26/25.
//

import SwiftUI

struct KeyView: View {
    let keyName: String
    
    var baseKey: String = ""
    var shiftKey: String = ""
    var optionKey: String = ""
    var optionShiftKey: String = ""
    
//    var onButtonPressed: () -> Void
    
    var widthFactor: CGFloat = 1
    
    var body: some View {
        ZStack {
            Button(action: {}) {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary.opacity(0.1))
                        .frame(width: 60 * widthFactor - 8, height: 52)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    HStack(alignment: .top) {
                        VStack {
                            Text(keyName)
                            Spacer()
                        }
                        Spacer()
                        VStack {
                            Text(shiftKey)
                            Spacer()
                            Text(baseKey)
                        }
                    }
                    .padding(6)
                    .frame(width: 60 * widthFactor - 8, height: 52)
                }
            }
            .padding(4)
            .buttonStyle(.plain)
        }
    }
}

struct ModifierKeyView: View {
    enum Modifier: String {
        case `return` = "return"
        case capslock = "capslock"
        case delete = "delete.left"
        case tab = "arrow.right.to.line"
        case shift = "shift"
        case command = "command"
        case control = "control"
        case option = "option"
        case eisu = "英数"
        case kana = "かな"
    }
    enum Direction {
        case leading
        case trailing
    }
    let direction: TextAlignment
    let modifier: Modifier
    
    var widthFactor: CGFloat = 1
    
    var body: some View {
        ZStack {
            Button(action: {}) {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary.opacity(0.2))
                        .frame(width: 60 * widthFactor - 8, height: 52)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    VStack {
                        switch modifier {
                        case .option, .command, .control:
                            HStack {
                                if direction == .trailing {
                                    Spacer()
                                }
                                Image(systemName: modifier.rawValue)
                                    .imageScale(.medium)
                                if direction == .leading {
                                    Spacer()
                                }
                            }
                            Spacer()
                            HStack {
                                if direction == .trailing {
                                    Spacer()
                                }
                                Text(modifier.rawValue)
                                if direction == .leading {
                                    Spacer()
                                }
                            }
                        case .eisu, .kana:
                            Spacer()
                            HStack {
                                if direction == .trailing {
                                    Spacer()
                                }
                                Text(modifier.rawValue)
                                if direction == .leading {
                                    Spacer()
                                }
                            }
                        default:
                            Spacer()
                            HStack {
                                if direction == .trailing {
                                    Spacer()
                                }
                                Image(systemName: modifier.rawValue)
                                    .imageScale(.medium)
                                if direction == .leading {
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding(4)
                    .frame(width: 60 * widthFactor - 8, height: 52)
                }
            }
            .padding(4)
            .buttonStyle(.plain)
        }
    }
}

struct ClickableModifierKeyView: View {
    enum Modifier: String {
        case capslock = "capslock"
        case shift = "shift"
        case option = "option"
    }
    enum Direction {
        case leading
        case trailing
    }
    let direction: TextAlignment
    let modifier: Modifier
    
    var widthFactor: CGFloat = 1
    
    @Binding var pressed: Bool
    
    var body: some View {
        ZStack {
            Button(action: {
                pressed = !pressed
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary.opacity(pressed ? 0.4 : 0.2))
                        .frame(width: 60 * widthFactor - 8, height: 52)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                    VStack {
                        switch modifier {
                        case .option:
                            HStack {
                                if direction == .trailing {
                                    Spacer()
                                }
                                Image(systemName: modifier.rawValue)
                                    .imageScale(.medium)
                                if direction == .leading {
                                    Spacer()
                                }
                            }
                            Spacer()
                            HStack {
                                if direction == .trailing {
                                    Spacer()
                                }
                                Text(modifier.rawValue)
                                if direction == .leading {
                                    Spacer()
                                }
                            }
                        default:
                            Spacer()
                            HStack {
                                if direction == .trailing {
                                    Spacer()
                                }
                                Image(systemName: modifier.rawValue)
                                    .imageScale(.medium)
                                if direction == .leading {
                                    Spacer()
                                }
                            }
                        }
                    }
                    .padding(4)
                    .frame(width: 60 * widthFactor - 8, height: 52)
                }
            }
            .padding(4)
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    HStack(spacing: 0) {
        KeyView(keyName: "A", baseKey: "1", shiftKey: "2", optionKey: "3", optionShiftKey: "4")
        ClickableModifierKeyView(direction: .leading, modifier: .capslock, pressed: .constant(false))
        ClickableModifierKeyView(direction: .trailing, modifier: .shift, pressed: .constant(true))
        ModifierKeyView(direction: .leading, modifier: .tab)
        ModifierKeyView(direction: .trailing, modifier: .control)
        ModifierKeyView(direction: .leading, modifier: .eisu)
        ModifierKeyView(direction: .trailing, modifier: .kana)
    }
}
