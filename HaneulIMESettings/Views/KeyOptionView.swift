//
//  KeyOptionView.swift
//  IMKitSample
//
//  Created by 강우현 on 11/30/25.
//

import SwiftUI

struct KeyOptionView: View {
//    @Environment(\.dismiss) var dismiss
    let key: Key
    @State var expression = "T < 2 ? H2|G_ : H2|_G"
    @State var keyActionType: KeyActionType = .dubeolsikJamo
    @State var showExpressionForm: Bool = false
    @State var characterBuffer: String = ""
    
    enum KeyActionType {
        case generalCharacter
        case dubeolsikJamo
        case sebeolsikJamo
        case advanced
    }
    
    var body: some View {
        Form {
            Section {
                Picker("역할", selection: $keyActionType) {
                    Text("일반 문자 입력").tag(KeyActionType.generalCharacter)
                    Text("두벌식 낱자 입력").tag(KeyActionType.dubeolsikJamo)
                    Text("세벌식 낱자 입력").tag(KeyActionType.sebeolsikJamo)
                    Text("고급").tag(KeyActionType.advanced)
                        .selectionDisabled()
                }
                if keyActionType != .advanced {
                    TextField("문자", text: $characterBuffer)
                }
            } header: {
                HStack(spacing: 0) {
                    if key.option {
                        Image(systemName: "option")
                    }
                    if key.shift {
                        Image(systemName: "shift")
                    }
                    Text("\(key.keyCode.name) 편집")
                }
            } footer: {
                Text("겹낱자는 구성 낱자를 늘어놓아 입력할 수 있습니다. (예: ‘ㅅㄱ’ → ‘ㅺ’)\n옛한글 낱자 중 반시옷은 ‘Z’로, 옛이응은 ‘O‘로, 여린히읗은 ‘X’로, 아래아는 ‘A’로 입력할 수 있습니다.")
            }
            Section("고급 설정", isExpanded: $showExpressionForm) {
                HStack {
                    Text("표현식")
                    TextField("", text: $expression)
                        .monospaced()
                }
                HStack {
                    Spacer()
                    Button("문자 상수 입력 도우미...", action: {})
                }
            }
        }
        .formStyle(.grouped)
        Divider()
        HStack {
            Spacer()
            Button("취소") { /* dismiss() */ }
            Button("확인", action: {})
                .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    KeyOptionView(key: Key(keyCode: .a, shift: false, option: true))
}
