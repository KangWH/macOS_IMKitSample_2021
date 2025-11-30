//
//  TestView.swift
//  IMKitSample
//
//  Created by 강우현 on 11/26/25.
//

import SwiftUI

enum SettingsTab: String, CaseIterable {
    case general = "일반"
    case security = "레이아웃"
    case privacy = "결합 규칙"
    case automata = "오토마타"
}

struct TestView: View {
    @State private var selectedTab: SettingsTab = .general
    
    var body: some View {
        VSplitView {
            HStack {
                ForEach(SettingsTab.allCases, id: \.self) { tab in
                    Button(tab.rawValue) {
                        selectedTab = tab
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()

            // 2. 선택된 탭에 따라 아래 콘텐츠 뷰 전환
            VStack {
                switch selectedTab {
                case .general:
                    Text("일반 설정 내용입니다.")
                        .padding()
                case .security:
                    Text("레이아웃 설정 내용입니다.")
                        .padding()
                case .privacy:
                    Text("결합 규칙 설정 내용입니다.")
                        .padding()
                case .automata:
                    Text("오토마타 설정 내용입니다.")
                        .padding()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    TestView()
}
