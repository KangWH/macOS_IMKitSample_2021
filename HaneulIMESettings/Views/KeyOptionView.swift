//
//  KeyOptionView.swift
//  IMKitSample
//
//  Created by 강우현 on 11/30/25.
//

import SwiftUI

struct KeyOptionView: View {
    @Environment(\.dismiss) var dismiss
    let key: Key
    @Binding var expression: String
    
    @State private var expressionBuffer: String
    
    init(key: Key, expression: Binding<String>) {
        self.key = key
        self._expression = expression
        self._expressionBuffer = State(initialValue: expression.wrappedValue)
    }
    
    var body: some View {
        Form {
            Section {
                HStack {
                    Text("표현식")
                    TextField("", text: $expressionBuffer)
                        .monospaced()
                }
                HStack {
                    Spacer()
                    Button("문자 상수 입력 도우미...", action: {})
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
            }
        }
        .formStyle(.grouped)
        Divider()
        HStack {
            Spacer()
            Button("취소") { dismiss() }
            Button("확인", action: {
                do {
                    let expression = try Expression.parse(expressionBuffer)
                } catch {
                    print("There is a syntax error in the expression.")
                }
            })
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}

#Preview {
    KeyOptionView(key: Key(keyCode: .a, shift: false, option: true), expression: .constant("Hello!"))
}
