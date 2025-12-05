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
    @Binding var shift: Bool
    @Binding var option: Bool
    @Binding var formula: String
    let width: Double
    
    private var key: Key {
        return Key(keyCode: keyCode, shift: shift, option: option)
    }
    private var expressionString: String {
        return keyboard.inputProcessorData.keyTable[key]!
    }
    private var expression: Expression {
        return try! Expression.parse(expressionString)
    }
    private var keyAction: KeyAction {
        var environment: ExpressionEnvironment = [:]
        return KeyAction.fromRawValue(expression.eval(env: &environment))
    }
    
    @State var keyEditing: Bool = false
    @State private var expressionBuffer: String = ""
    
    init(keyboard: Keyboard, keyCode: KeyCode, shift: Binding<Bool>, option: Binding<Bool>, formula: Binding<String>, width: Double = 1) {
        self._keyboard = Bindable(wrappedValue: keyboard)
        self.keyCode = keyCode
        self._shift = shift
        self._option = option
        self._formula = formula
        self.width = width
    }
    
    var body: some View {
        Button(action: {
            self.expressionBuffer = self.expressionString
            self.keyEditing.toggle()
        }) {
            ZStack {
                Rectangle()
                    .foregroundStyle(Color.secondary.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                Text(keyAction.previewString)
            }
        }
        .padding(2)
        .buttonStyle(.plain)
        .frame(width: 36 * width, height: 36)
        .help(keyCode.name)
        .sheet(isPresented: $keyEditing) {
            KeyOptionView(
                key: self.key,
                expression: $expressionBuffer,
                onSave: { newExpression in
                    self.saveExpression(newExpression)
                }
            )
        }
    }
    
    func saveExpression(_ newExpression: String) {
        keyboard.inputProcessorData.keyTable[self.key] = newExpression
    }
}


struct KeyboardView: View {
    @Bindable var keyboard: Keyboard
    var layoutType: LayoutType
    @Binding var shift: Bool
    @Binding var option: Bool
    @Binding var formula: String
    
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
                leftMargin: 0,
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
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.secondary.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(2)
                .frame(width: keyLayout[layoutType]![0].leftMargin, height: 36)
                if layoutType == .jis {
                    KeyView(keyboard: keyboard, keyCode: .one, shift: $shift, option: $option, formula: $formula, width: 1.5)
                    ForEach(keyLayout[layoutType]![0].keys.filter({ $0 != .one })) { keyCode in
                        KeyView(keyboard: keyboard, keyCode: keyCode, shift: $shift, option: $option, formula: $formula)
                    }
                } else {
                    ForEach(keyLayout[layoutType]![0].keys) { keyCode in
                        KeyView(keyboard: keyboard, keyCode: keyCode, shift: $shift, option: $option, formula: $formula)
                    }
                }
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.secondary.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(2)
                .frame(width: keyLayout[layoutType]![0].rightMargin, height: 36)
            }
            HStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.secondary.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(2)
                .frame(width: keyLayout[layoutType]![1].leftMargin, height: 36)
                ForEach(keyLayout[layoutType]![1].keys) { keyCode in
                    KeyView(keyboard: keyboard, keyCode: keyCode, shift: $shift, option: $option, formula: $formula)
                }
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.secondary.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(2)
                .frame(width: keyLayout[layoutType]![1].rightMargin, height: 36)
            }
            HStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.secondary.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(2)
                .frame(width: keyLayout[layoutType]![2].leftMargin, height: 36)
                ForEach(keyLayout[layoutType]![2].keys) { keyCode in
                    KeyView(keyboard: keyboard, keyCode: keyCode, shift: $shift, option: $option, formula: $formula)
                }
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.secondary.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(2)
                .frame(width: keyLayout[layoutType]![2].rightMargin, height: 36)
            }
            HStack(spacing: 0) {
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.secondary.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(2)
                .frame(width: keyLayout[layoutType]![3].leftMargin, height: 36)
                ForEach(keyLayout[layoutType]![3].keys) { keyCode in
                    KeyView(keyboard: keyboard, keyCode: keyCode, shift: $shift, option: $option, formula: $formula)
                }
                ZStack {
                    Rectangle()
                        .foregroundStyle(Color.secondary.opacity(0.4))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
                .padding(2)
                .frame(width: keyLayout[layoutType]![3].rightMargin, height: 36)
            }
        }
    }
}

struct LayoutView: View {
    @Bindable var keyboard: Keyboard
    @State var layoutType: LayoutType = .ansi
    @State var shiftActive: Bool = false
    @State var optionActive: Bool = false
    
    @State var showingDescriptionPopover: Bool = false
    
    var body: some View {
        Form {
            Section(footer: Text("편집하려는 키를 클릭하십시오. 마우스 포인터를 키 위에 올려두면 QWERTY 배열의 키가 표시됩니다.\n위의 토글 스위치를 사용하여 shift 또는 option 키를 누른 상태의 동작을 편집합니다.")) {
                KeyboardView(keyboard: keyboard, layoutType: layoutType, shift: $shiftActive, option: $optionActive, formula: .constant(""))
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
                HStack {
                    Spacer()
                    Button("설명...", action: { showingDescriptionPopover.toggle() })
                        .sheet(isPresented: $showingDescriptionPopover) {
                            VStack {
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("ANSI 배열은 미국 및 아시아의 표준 키보드 레이아웃입니다.")
                                    Text("ISO 배열은 유럽 및 아시아의 일부 국가에서 사용되는 키보드 레이아웃입니다. 역따옴표(`) 키가 Z의 왼쪽에 있으며, 그 자리에는 섹션(§) 키가 위치합니다.")
                                    Text("JIS 배열은 일본의 키보드 레이아웃입니다. 역따옴표 키가 없으며, 등호(=) 키 오른쪽에 엔화(¥) 키가, 빗금(/) 키 오른쪽에 밑줄(_) 키가 위치합니다.")
                                }
                                .padding()
                                Divider()
                                HStack {
                                    Spacer()
                                    Button("확인") { showingDescriptionPopover.toggle() }
                                        .buttonStyle(.borderedProminent)
                                }
                                .padding()
                            }
                        }
                }
            }
        }
        .formStyle(.grouped)
        .navigationTitle(Text("레이아웃"))
    }
}

#Preview {
    LayoutView(keyboard: dubeolsikOld)
}
