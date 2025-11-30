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
                    Picker("음절로 조합할 글자 범위", selection: $keyboard.hangulRange) {
                        Text("KS X 1001(완성형)").tag(Keyboard.HangulRange.ksx1001)
                        Text("현대 한글 전체").tag(Keyboard.HangulRange.modernFull)
                        Text("한양 PUA").tag(Keyboard.HangulRange.hanyangPUA)
                        Text("가능한 모든 한글 조합").tag(Keyboard.HangulRange.oldFull)
                    }
                }
                Section {
                    NavigationLink(destination: LayoutView(keyboard: keyboard)) {
                        BackgroundIcon(label: "레이아웃", iconName: "keyboard.fill")
                    }
                    NavigationLink(destination: EmptyView()) {
                        BackgroundIcon(label: "무시할 키", iconName: "nosign.app.fill")
                    }
                    NavigationLink(destination: EmptyView()) {
                        BackgroundIcon(label: "낱자 조합 규칙", iconName: "squares.leading.rectangle.fill")
                    }
                    NavigationLink(destination: EmptyView()) {
                        BackgroundIcon(label: "오토마타", iconName: "point.bottomleft.forward.to.arrow.triangle.scurvepath.fill")
                    }
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
