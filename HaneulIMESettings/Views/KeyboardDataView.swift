//
//  KeyboardView.swift
//  HaneulIMESettings
//
//  Created by 강우현 on 11/29/25.
//

import SwiftUI

struct BackgroundIcon: View {
    let label: String
    let iconName: String
    
    var body: some View {
        HStack {
            ZStack {
                Rectangle()
                    .frame(width: 24, height: 24)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                    .foregroundStyle(Color.accentColor)
                Image(systemName: iconName)
                    .foregroundStyle(Color.white)
            }
            Text(label)
        }
    }
}

struct KeyboardDataView: View {
    @Bindable var keyboard: Keyboard
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("이름", text: $keyboard.name)
                    TextField("내부 식별자", text: $keyboard.id)
                }
                Section(header: Text("키 입력 처리")) {
                    Picker("처리 수준", selection: $keyboard.inputLevel) {
                        Text("처리 안 함").tag(Keyboard.Level.plain)
                        Text("기본").tag(Keyboard.Level.basic)
                        Text("고급").tag(Keyboard.Level.advanced)
                    }
                    NavigationLink(destination: LayoutView(keyboard: keyboard)) {
                        BackgroundIcon(label: "레이아웃", iconName: "keyboard.fill")
                    }
                    .disabled(keyboard.inputLevel == .plain)
                    NavigationLink(destination: EmptyView()) {
                        BackgroundIcon(label: "특수 키 설정", iconName: "nosign.app.fill")
                    }
                    .disabled(keyboard.inputLevel == .plain)
                    NavigationLink(destination: EmptyView()) {
                        BackgroundIcon(label: "고급 입력 인식", iconName: "arrow.down.to.line")
                    }
                    .disabled(keyboard.inputLevel != .advanced)
                    NavigationLink(destination: EmptyView()) {
                        BackgroundIcon(label: "추가 옵션", iconName: "ellipsis")
                    }
                    .disabled(keyboard.inputLevel != .advanced)
                }
                Section(header: Text("문자 출력 처리")) {
                    Picker("처리 수준", selection: $keyboard.outputLevel) {
                        Text("처리 안 함").tag(Keyboard.Level.plain)
                        Text("기본").tag(Keyboard.Level.basic)
                        Text("고급").tag(Keyboard.Level.advanced)
                    }
                    Picker("음절로 조합할 글자 범위", selection: $keyboard.outputProcessorData.composableSyllableRange) {
                        Text("KS X 1001(완성형)").tag(OutputProcessorData.SyllableRange.ksx1001)
                        Text("현대 한글 전체").tag(OutputProcessorData.SyllableRange.modernFull)
                        Text("한양 PUA").tag(OutputProcessorData.SyllableRange.hanyangPUA)
                        Text("가능한 모든 한글 조합").tag(OutputProcessorData.SyllableRange.oldFull)
                    }
                    .disabled(keyboard.outputLevel == .plain)
                    NavigationLink(destination: EmptyView()) {
                        BackgroundIcon(label: "낱자 조합 규칙", iconName: "squares.leading.rectangle.fill")
                    }
                    .disabled(keyboard.outputLevel == .plain)
                    NavigationLink(destination: EmptyView()) {
                        BackgroundIcon(label: "가상 낱자 대응 규칙", iconName: "questionmark.square.fill")
                    }
                    .disabled(keyboard.outputLevel == .plain)
                    NavigationLink(destination: EmptyView()) {
                        BackgroundIcon(label: "특수 도깨비불 규칙", iconName: "rays")
                    }
                    .disabled(keyboard.outputLevel == .plain)
                    NavigationLink(destination: EmptyView()) {
                        BackgroundIcon(label: "결합 축약 규칙", iconName: "rectangle.compress.vertical")
                    }
                    .disabled(keyboard.outputLevel == .plain)
                    NavigationLink(destination: EmptyView()) {
                        BackgroundIcon(label: "오토마타", iconName: "point.bottomleft.forward.to.arrow.triangle.scurvepath.fill")
                    }
                    .disabled(keyboard.outputLevel == .plain)
                }
            }
            .formStyle(.grouped)
        }
        .navigationTitle(Text(keyboard.name))
    }
}

#Preview {
    KeyboardDataView(keyboard: dubeolsik)
}
