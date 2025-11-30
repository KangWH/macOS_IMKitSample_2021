//
//  SettingsView.swift
//  HaneulIMESettings
//
//  Created by 강우현 on 11/29/25.
//

import SwiftUI

enum MenuItem: Identifiable, Hashable {
    case general
    case keyboard(Keyboard)

    var id: String {
        switch self {
        case .general:
            return "general"
        case .keyboard(let keyboard):
            return keyboard.id
        }
    }
}

struct SettingsView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    @State var selectedMenu = MenuItem.general
    
    var body: some View {
        NavigationSplitView {
            List(selection: $selectedMenu) {
                Section {
                    NavigationLink(value: MenuItem.general) {
                        Label("일반 설정", systemImage: "gear")
                    }
                }
                Section("Keyboards") {
                    ForEach(appEnvironment.keyboards) { keyboard in
                        NavigationLink(value: MenuItem.keyboard(keyboard)) {
                            Label(keyboard.name, systemImage: "keyboard")
                        }
                    }
                }
            }
        } detail: {
            switch selectedMenu {
            case .general:
                GeneralView()
                    .environmentObject(appEnvironment)
            case .keyboard(let keyboard):
                KeyboardDataView(keyboard: keyboard)
            }
        }
        .toolbar(id: "keyboard-view") {
            ToolbarItem(id: "new", placement: .automatic) {
                Menu {
                    Button("빈 레이아웃", action: {})
                    Divider()
                    Button("두벌식", action: {})
                    Button("두벌식 옛글", action: {})
                    Divider()
                    Button("세벌식 3-90", action: {})
                    Button("세벌식 3-91", action: {})
                    Button("세벌식 순아래", action: {})
                    Button("세벌식 옛글", action: {})
                    Divider()
                    Button("로마자 입력", action: {})
                } label: {
                    Label("신규", systemImage: "plus")
                }
            }
            ToolbarItem(id: "duplicate", placement: .automatic) {
                Button(action: {}) {
                    Label("복제", systemImage: "plus.square.on.square")
                }
            }
            .defaultCustomization(.hidden)
            ToolbarItem(id: "open", placement: .automatic) {
                Button(action: {}) {
                    Label("열기", systemImage: "arrow.up.right.square")
                }
            }
            ToolbarSpacer()
            ToolbarItem(id: "save", placement: .automatic) {
                Button(action: {}) {
                    Label("저장", systemImage: "square.and.arrow.down")
                }
            }
            ToolbarItem(id: "export", placement: .automatic) {
                Button(action: {}) {
                    Label("내보내기", systemImage: "square.and.arrow.up")
                }
            }
            ToolbarSpacer()
            ToolbarItem(id: "clear", placement: .automatic) {
                Button(action: {}) {
                    Label("초기화", systemImage: "clear")
                }
            }
            .defaultCustomization(.hidden)
            ToolbarItem(id: "delete", placement: .automatic) {
                Button(action: {}) {
                    Label("삭제", systemImage: "trash")
                }
            }
        }
    }
}

#Preview {
    SettingsView()
        .environmentObject(AppEnvironment())
}
