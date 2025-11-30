//
//  GeneralView.swift
//  HaneulIMESettings
//
//  Created by 강우현 on 11/29/25.
//

import SwiftUI

struct GeneralView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    var body: some View {
        Form {
            Section {
                Picker(selection: $appEnvironment.processingUnit, label: Text("조합 처리 단위")) {
                    Text("음절").tag(AppEnvironment.ProcessingUnit.syllable)
                    Text("어절").tag(AppEnvironment.ProcessingUnit.word)
                }
                .pickerStyle(.radioGroup)
                Picker(selection: $appEnvironment.oldHangulMethod, label: Text("옛한글 표현 방식")) {
                    Text("한글 자모 (표준)").tag(AppEnvironment.OldHangulMethod.standard)
                    Text("한양 PUA").tag(AppEnvironment.OldHangulMethod.PUA)
                }
                .pickerStyle(.radioGroup)
            }
            Section {
                TextField("한자·기호 변환", text: .constant("option return"))
                    .disabled(true)
                TextField("글자판 간 전환", text: .constant("shift space"))
                    .disabled(true)
            } header: {
                Text("단축키")
            } footer: {
                Text("하늘 입력기 내의 글자판 간 전환에 위의 단축키가 사용됩니다.\n하늘 입력기와 다른 입력기와의 전환은 \(Image(systemName: "control"))+스페이스나 caps lock 키를 사용합니다.")
            }
        }
        .formStyle(.grouped)
        .navigationTitle("일반 설정")
    }
}

#Preview {
    GeneralView()
        .environmentObject(AppEnvironment())
}
