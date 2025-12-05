//
//  KeyActionInputView.swift
//  HaneulIMESettings
//
//  Created by 강우현 on 12/4/25.
//

import SwiftUI

struct KeyActionInputView: View {
    @Environment(\.dismiss) var dismiss
    
    @State var selectedKeyActionType: KeyActionType = .normalCharacter
    @State private var updatingField: String? = nil
    
    @State var normalCharacterString: String = ""
    @State var normalCharacterCode: String = ""
    @FocusState private var isNormalCharacterCodeFocused: Bool
    
    @State var keySet: Bool = false
    @State var jamoOrder: Int = 0
    
    @State var specialKeyCode: Int = 0x88
    
    enum KeyActionType {
        case normalCharacter
        case multipleCharacter
        case hangul
        case specialKey
        case keyPress
        case automataState
    }
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedKeyActionType) {
                NavigationLink(value: KeyActionType.normalCharacter, label: {
                    Label("일반 문자", systemImage: "character")
                })
                NavigationLink(value: KeyActionType.multipleCharacter, label: {
                    Label("다중 문자", systemImage: "abc")
                })
                NavigationLink(value: KeyActionType.hangul, label: {
                    Label("한글 낱자", systemImage: "character.ko")
                })
                NavigationLink(value: KeyActionType.specialKey, label: {
                    Label("특수 동작", systemImage: "wand.and.stars")
                })
                NavigationLink(value: KeyActionType.keyPress, label: {
                    Label("키 입력 전달", systemImage: "rectangle.portrait.and.arrow.right")
                })
                NavigationLink(value: KeyActionType.automataState, label: {
                    Label("상태 변경", systemImage: "arrow.trianglehead.branch")
                })
            }
        } detail: {
            Form {
                switch selectedKeyActionType {
                case .normalCharacter:
                    Section(footer: Text("Control-Command-스페이스를 눌러 기호 팔레트를 열 수 있습니다.")) {
                        TextField("문자", text: $normalCharacterString)
                            .onChange(of: normalCharacterString) {
                                guard updatingField != "normalCharacterCode" else {
                                    return
                                }
                                updatingField = "normalCharacterString"
                                
                                if normalCharacterString.count > 1 {
                                    normalCharacterString = String(normalCharacterString[normalCharacterString.startIndex])
                                }
                                if let firstCharacter = normalCharacterString.unicodeScalars.first {
                                    let unicode = firstCharacter.value
                                    normalCharacterCode = String(format: unicode < 0x100 ? "0x%02X" : "0x%04X", unicode)
                                } else {
                                    normalCharacterCode = ""
                                }
                                
                                updatingField = nil
                            }
                        HStack {
                            Text("유니코드")
                            TextField("", text: $normalCharacterCode, onCommit: {
                                processNormalCharacterCode()
                            })
                                .monospaced()
                                .focused($isNormalCharacterCodeFocused)
                                .onChange(of: isNormalCharacterCodeFocused) {
                                    if !isNormalCharacterCodeFocused {
                                        processNormalCharacterCode()
                                    }
                                }
                        }
                    }
                case .multipleCharacter:
                    Section(footer: Text("UTF-16 인코딩으로 최대 3글자까지 지정할 수 있습니다.")) {
                        TextField("문자", text: .constant("ABC"))
                        HStack {
                            Text("유니코드")
                            TextField("", text: .constant("0x41 0x42 0x43"))
                                .monospaced()
                        }
                    }
                case .hangul:
                    Section(footer: Text(keySet ? "낱자 삽입 순서는 둘 이상의 낱자를 지정한 경우에만 유의미합니다." : "")) {
                        TextField("초성", text: .constant("ㅎ"))
                        TextField("중성", text: .constant("ㅏ"))
                        TextField("종성", text: .constant("ㄴ"))
                        Picker("낱자 처리 방식", selection: $keySet) {
                            Text("두벌식").tag(false)
                            Text("세벌식").tag(true)
                        }
                        if keySet {
                            Picker("낱자 삽입 순서", selection: $jamoOrder) {
                                Text("초성-중성-종성").tag(0)
                                Text("중성-종성-초성").tag(1)
                                Text("종성-초성-중성").tag(2)
                            }
                        }
                    }
                case .specialKey:
                    Section {
                        HStack {
                            Text("동작 코드")
                            TextField("", text: .constant("0x23"))
                                .monospaced()
                        }
                    }
                    Section {
                        List(selection: $specialKeyCode) {
                            Text("0x02: 현재 음절의 초성 삭제").tag(0x02)
                            Text("0x03: 현재 음절의 중성 삭제").tag(0x03)
                            Text("0x04: 현재 음절의 종성 삭제").tag(0x04)
                            Text("0x05: 초성을 앞 글자로 보내기").tag(0x05)
                            Text("0x06: 초성을 앞 글자로 보내기").tag(0x06)
                            Text("0x07: 초성을 앞 글자로 보내기").tag(0x07)
                            Text("0x08: 초성을 뒤 글자로 보내기").tag(0x08)
                            Text("0x09: 초성을 뒤 글자로 보내기").tag(0x09)
                            Text("0x0A: 초성을 뒤 글자로 보내기").tag(0x0A)
                            Text("0x0D: 조합 중단 후 앞 글자로 커서 이동").tag(0x0D)
                            Text("0x0E: 조합 중단 후 뒤 글자로 커서 이동").tag(0x0E)
                            Text("0x82: 변환 1").tag(0x82)
                            Text("0x83: 변환 2").tag(0x83)
                            Text("0x84: 변환 3").tag(0x84)
                            Text("0x85: 변환 4").tag(0x85)
                            Text("0x88: 문자 삭제 1").tag(0x88)
                            Text("0x89: 문자 삭제 2").tag(0x89)
                            Text("0x8A: 문자 삭제 3").tag(0x8A)
                            Text("0x8B: 문자 삭제 4").tag(0x8B)
                        }
                    }
                case .keyPress:
                    EmptyView()
                case .automataState:
                    EmptyView()
                }
            }
            .formStyle(.grouped)
            Divider()
            HStack {
                Spacer()
                Button("취소") { dismiss() }
                Button("확인") { /*dismiss()*/ }
                    .buttonStyle(.borderedProminent)
            }
            .padding()
        }
        .frame(minHeight: 360)
    }
    
    private func parseAndFormatNumber(_ string: String) -> (value: Int, hex: String, string: String)? {
        if string.hasPrefix("0x") || string.hasPrefix("U+") {
            // Parse as hexadecimal
            if let value = Int(string.dropFirst(2), radix: 16), let unicodeScalar = UnicodeScalar(value) {
                let hexString = String(format: value < 0x100 ? "U+%02X" : "U+%04X", value)
                let string = String(unicodeScalar)
                return (value: value, hex: hexString, string: string)
            }
        } else {
            // Parse as decimal
            if let value = Int(string), let unicodeScalar = UnicodeScalar(value) {
                let hexString = String(format: value < 0x100 ? "U+%02X" : "U+%04X", value)
                let string = String(unicodeScalar)
                return (value: value, hex: hexString, string: string)
            }
        }
        return nil
    }
    private func processNormalCharacterCode() {
        updatingField = "normalCharacterCode"
        
        let parseResult = parseAndFormatNumber(normalCharacterCode)
        if let parseResult = parseResult {
            normalCharacterString = parseResult.string
        }
        
        updatingField = nil
    }
}

#Preview {
    KeyActionInputView()
}
