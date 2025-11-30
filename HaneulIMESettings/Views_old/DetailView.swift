//
//  DetailView.swift
//  IMKitSample
//
//  Created by 강우현 on 11/26/25.
//

import SwiftUI

struct DetailView: View {
    enum DetailViewState {
        case general
        case layout
        case rules
        case automata
    }
    
    @State var keyboard: Keyboard
    
    @State private var activeTab = DetailViewState.general
    @State private var editingLayout = false
    @State private var editingRules = false
    @State private var usePUAForOldHangul: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            Form {
                Section {
                    TextField("Name", text: $keyboard.name)
                    TextField("Description", text: $keyboard.description)
                    Picker("Composable syllables", selection: $keyboard.hangulRange) {
                        Text("KS X 1001(완성형)").tag(Keyboard.HangulRange.ksx1001)
                        Text("현대 한글 전체").tag(Keyboard.HangulRange.modernFull)
                        Text("한양 PUA").tag(Keyboard.HangulRange.hanyangPUA)
                        Text("가능한 모든 한글 조합").tag(Keyboard.HangulRange.oldFull)
                    }
                }
                Section {
                    NavigationLink(destination: LayoutView()){
                        Label("Edit layout", systemImage: "keyboard")
                    }
                    NavigationLink(destination: EmptyView()) {
                        Label("Edit ignored keys", systemImage: "questionmark.square.dashed")
                    }
                    NavigationLink(destination: RulesView(isPresented: $editingRules)) {
                        Label("Edit composition rules", systemImage: "squares.leading.rectangle")
                    }
                    NavigationLink(destination: EmptyView()) {
                        Label("Edit automata", systemImage: "point.bottomleft.forward.to.arrow.triangle.scurvepath")
                    }
                }
            }
            .formStyle(.grouped)
        }
        .toolbar {
            Button(action: {}) {
                Label("Save", systemImage: "square.and.arrow.down")
            }
        }
        .navigationTitle(keyboard.name)
    }
}

#Preview {
    var dubeolsikEditable = dubeolsik
    DetailView(keyboard: dubeolsikEditable)
        .frame(minWidth: 480, minHeight: 360)
}
