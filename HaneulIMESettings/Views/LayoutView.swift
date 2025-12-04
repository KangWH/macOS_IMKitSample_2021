//
//  LayoutView.swift
//  HaneulIMESettings
//
//  Created by 강우현 on 11/29/25.
//

import SwiftUI

enum LayoutType {
    case ansi
    case iso
    case jis
}

struct KeyView: View {
    @Bindable var keyboard: Keyboard
    let keyCode: KeyCode
    let status: (shift: Bool, option: Bool, formula: String)
    
    private let key: Key
    private var environment: ExpressionEnvironment = [:]
    @State var expressionString: String
    private var expression: Expression
    private var keyAction: KeyAction
    private var keyString: String
    
    init(keyboard: Keyboard, keyCode: KeyCode, status: (shift: Bool, option: Bool, formula: String)) {
        self.keyboard = keyboard
        self.keyCode = keyCode
        self.status = status
        
        self.key = Key(keyCode: keyCode, shift: status.shift, option: status.option)
        self.expressionString = keyboard.inputProcessorData.keyTable[key]!
        self.expression = try! Expression.parse(expressionString)
        self.keyAction = KeyAction.fromRawValue(expression.eval(env: &environment))
        self.keyString = keyAction.previewString
    }
    
    @State var keyEditing: Bool = false
    
    var body: some View {
        
        Button(action: {
            keyEditing = true
        }) {
            ZStack {
                Rectangle()
                    .foregroundStyle(Color.secondary.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                Text(keyString)
            }
        }
        .padding(2)
        .buttonStyle(.plain)
        .frame(width: 36, height: 36)
        .sheet(isPresented: $keyEditing) { KeyOptionView(key: self.key, expression: $expressionString) }
    }
}

struct KeyboardView: View {
    @Bindable var keyboard: Keyboard
    var layoutType: LayoutType
    var status: (shift: Bool, option: Bool, formula: String)
    
    private let keyLayout: [LayoutType: [(leftMargin: CGFloat, keys: [KeyCode], rightMargin: CGFloat)]] = [
        LayoutType.ansi: [
            (
                leftMargin: 0,
                keys: [KeyCode.grave, KeyCode.one, KeyCode.two, KeyCode.three, KeyCode.four, KeyCode.five, KeyCode.six, KeyCode.seven, KeyCode.eight, KeyCode.nine, KeyCode.zero, KeyCode.minus, KeyCode.equal],
                rightMargin: 54
            ),
            (
                leftMargin: 54,
                keys: [KeyCode.q, KeyCode.w, KeyCode.e, KeyCode.r, KeyCode.t, KeyCode.y, KeyCode.u, KeyCode.i, KeyCode.o, KeyCode.p, KeyCode.leftBracket, KeyCode.rightBracket, KeyCode.backslash],
                rightMargin: 0
            ),
            (
                leftMargin: 63,
                keys: [KeyCode.a, KeyCode.s, KeyCode.d, KeyCode.f, KeyCode.g, KeyCode.h, KeyCode.j, KeyCode.k, KeyCode.l, KeyCode.semicolon, KeyCode.quote],
                rightMargin: 63
            ),
            (
                leftMargin: 81,
                keys: [KeyCode.z, KeyCode.x, KeyCode.c, KeyCode.v, KeyCode.b, KeyCode.n, KeyCode.m, KeyCode.comma, KeyCode.period, KeyCode.slash],
                rightMargin: 81
            )
        ],
        LayoutType.iso: [
            (
                leftMargin: 0,
                keys: [KeyCode.section, KeyCode.one, KeyCode.two, KeyCode.three, KeyCode.four, KeyCode.five, KeyCode.six, KeyCode.seven, KeyCode.eight, KeyCode.nine, KeyCode.zero, KeyCode.minus, KeyCode.equal],
                rightMargin: 54
            ),
            (
                leftMargin: 54,
                keys: [KeyCode.q, KeyCode.w, KeyCode.e, KeyCode.r, KeyCode.t, KeyCode.y, KeyCode.u, KeyCode.i, KeyCode.o, KeyCode.p, KeyCode.leftBracket, KeyCode.rightBracket],
                rightMargin: 36
            ),
            (
                leftMargin: 63,
                keys: [KeyCode.a, KeyCode.s, KeyCode.d, KeyCode.f, KeyCode.g, KeyCode.h, KeyCode.j, KeyCode.k, KeyCode.l, KeyCode.semicolon, KeyCode.quote, KeyCode.backslash],
                rightMargin: 27
            ),
            (
                leftMargin: 45,
                keys: [KeyCode.grave, KeyCode.z, KeyCode.x, KeyCode.c, KeyCode.v, KeyCode.b, KeyCode.n, KeyCode.m, KeyCode.comma, KeyCode.period, KeyCode.slash],
                rightMargin: 81
            )
        ],
        LayoutType.jis: [
            (
                leftMargin: 18,
                keys: [KeyCode.one, KeyCode.two, KeyCode.three, KeyCode.four, KeyCode.five, KeyCode.six, KeyCode.seven, KeyCode.eight, KeyCode.nine, KeyCode.zero, KeyCode.minus, KeyCode.equal, KeyCode.yen],
                rightMargin: 36
            ),
            (
                leftMargin: 36,
                keys: [KeyCode.q, KeyCode.w, KeyCode.e, KeyCode.r, KeyCode.t, KeyCode.y, KeyCode.u, KeyCode.i, KeyCode.o, KeyCode.p, KeyCode.leftBracket, KeyCode.rightBracket],
                rightMargin: 54
            ),
            (
                leftMargin: 45,
                keys: [KeyCode.a, KeyCode.s, KeyCode.d, KeyCode.f, KeyCode.g, KeyCode.h, KeyCode.j, KeyCode.k, KeyCode.l, KeyCode.semicolon, KeyCode.quote, KeyCode.backslash],
                rightMargin: 45
            ),
            (
                leftMargin: 63,
                keys: [KeyCode.z, KeyCode.x, KeyCode.c, KeyCode.v, KeyCode.b, KeyCode.n, KeyCode.m, KeyCode.comma, KeyCode.period, KeyCode.slash, KeyCode.underscore],
                rightMargin: 63
            )
        ]
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 0) {
                Rectangle()
                    .fill(.clear)
                    .frame(width: keyLayout[layoutType]![0].leftMargin, height: 4)
                ForEach(keyLayout[layoutType]![0].keys) { keyCode in
                    KeyView(keyboard: keyboard, keyCode: keyCode, status: status)
                }
                Rectangle()
                    .fill(.clear)
                    .frame(width: keyLayout[layoutType]![0].rightMargin, height: 4)
            }
            HStack(spacing: 0) {
                Rectangle()
                    .fill(.clear)
                    .frame(width: keyLayout[layoutType]![1].leftMargin, height: 4)
                ForEach(keyLayout[layoutType]![1].keys) { keyCode in
                    KeyView(keyboard: keyboard, keyCode: keyCode, status: status)
                }
                Rectangle()
                    .fill(.clear)
                    .frame(width: keyLayout[layoutType]![1].rightMargin, height: 4)
            }
            HStack(spacing: 0) {
                Rectangle()
                    .fill(.clear)
                    .frame(width: keyLayout[layoutType]![2].leftMargin, height: 4)
                ForEach(keyLayout[layoutType]![2].keys) { keyCode in
                    KeyView(keyboard: keyboard, keyCode: keyCode, status: status)
                }
                Rectangle()
                    .fill(.clear)
                    .frame(width: keyLayout[layoutType]![2].rightMargin, height: 4)
            }
            HStack(spacing: 0) {
                Rectangle()
                    .fill(.clear)
                    .frame(width: keyLayout[layoutType]![3].leftMargin, height: 4)
                ForEach(keyLayout[layoutType]![3].keys) { keyCode in
                    KeyView(keyboard: keyboard, keyCode: keyCode, status: status)
                }
                Rectangle()
                    .fill(.clear)
                    .frame(width: keyLayout[layoutType]![3].rightMargin, height: 4)
            }
        }
    }
}

struct LayoutView: View {
    @Bindable var keyboard: Keyboard
    @State var layoutType: LayoutType = .ansi
    @State var shiftActive: Bool = false
    @State var optionActive: Bool = false
    
    var body: some View {
        Form {
            Section(footer: Text("편집하려는 키를 클릭하십시오. 위의 토글 스위치를 사용하여 shift 또는 option 키를 누른 상태의 동작을 편집합니다.")) {
                KeyboardView(keyboard: keyboard, layoutType: layoutType, status: (shift: shiftActive, option: optionActive, formula: ""))
                HStack {
                    Toggle(isOn: $shiftActive) {Text("\(Image(systemName: "shift")) Shift 키")}
                    Divider()
                    Toggle(isOn: $optionActive) {Text("\(Image(systemName: "option")) Option 키")}
                }
            }
            
            Section {
                Picker(selection: $layoutType, label: Text("키보드 종류")) {
                    Text("ANSI").tag(LayoutType.ansi)
                    Text("ISO").tag(LayoutType.iso)
                    Text("JIS").tag(LayoutType.jis)
                }
                .pickerStyle(.radioGroup)
            }
        }
        .formStyle(.grouped)
        .navigationTitle(Text("레이아웃"))
    }
}

#Preview {
    LayoutView(keyboard: dubeolsikOld)
}
