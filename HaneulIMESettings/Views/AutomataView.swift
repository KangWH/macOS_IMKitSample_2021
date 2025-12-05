//
//  AutomataView.swift
//  HaneulIMESettings
//
//  Created by 강우현 on 12/5/25.
//

import SwiftUI

struct AutomataItem: Identifiable, Hashable {
    let id: Int
    var expression: String
    var fallBack: Int
    var description: String
    
    var wrappedID: String { String(id) }
}
//class AutomataViewModel: ObservableObject {
//    
//}

struct AutomataView: View {
    @Bindable var keyboard: Keyboard
    
    @State var sampleData = [
//        SampleAutomataData(state: 0, expression: "A ? 1 : B ? 2 : C ? 3 : 0", fallBack: 0, description: "기본 상태"),
//        SampleAutomataData(state: 1, expression: "A ? 1 : B ? 2 : C ? 3 : 0", fallBack: 0, description: "초성 입력 상태"),
//        SampleAutomataData(state: 2, expression: "B ? 2 : C ? 3 : 0", fallBack: 0, description: "중성 입력 상태"),
//        SampleAutomataData(state: 3, expression: "C ? 3 : 0", fallBack: 0, description: "종성 입력 상태"),
    ]
    
    var body: some View {
        Form {
//            Table(sampleData) {
//                TableColumn("상태", value: \.state) { data in Text("\(data.state)") }
//                TableColumn("표현식", value: \.expression)
//                TableColumn("조합이 아닐 때", value: \.fallBack)
//            }
            Section {
                Toggle("조합 실패 시 현재 상황을 항상 0으로 처리", isOn: .constant(true))
            }
        }
        .formStyle(.grouped)
        HStack {
            Spacer()
            Button("프리셋 가져오기", action: {})
        }
        .padding()
        .navigationTitle(Text("오토마타"))
    }
}

#Preview {
    AutomataView(keyboard: dubeolsik)
}
