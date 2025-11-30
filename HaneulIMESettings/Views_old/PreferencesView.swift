//
//  PreferencesView.swift
//  IMKitSample
//
//  Created by 강우현 on 11/26/25.
//

import Combine
import SwiftUI

struct HomeView: View {
    var body: some View {
        Text("Home")
            .navigationTitle(Text("Home"))
    }
}

class PreferencesViewModel: ObservableObject {
    let systemKeyboards = [dubeolsik, dubeolsikOld]
    
    @Published var menuItems: [MenuItem] = []
    @Published var selectedItem: MenuItem
    
    private var activeKeyboards: [String: (system: Bool, data: Keyboard)] = [:]
//    var detailViews: [DetailView] = []
    
    struct MenuItem: Identifiable, Hashable {
        let id = UUID()
        let label: String
        let iconName: String
        let systemMenu: Bool
        let editable: Bool
        let identifier: String?
    }
    let homeMenu = MenuItem(label: "Home", iconName: "house", systemMenu: true, editable: false, identifier: nil)

    init() {
        self.selectedItem = homeMenu
        
        guard let userDefaults = UserDefaults.shared else {
            NSLog("Error: Failed to access UserDefaults container. Dubeolsik keyboard is used.")
            activeKeyboards = [dubeolsik.id: (system: true, data: dubeolsik)]
            setMenuItems()
            return
        }
        
        if let array = userDefaults.array(forKey: "ActiveKeyboardIDs") as? [String] {
            for id in array {
                if let keyboard = systemKeyboards.first(where: { $0.id == id }) {
                    activeKeyboards[keyboard.id] = (system: true, data: keyboard)
                    continue
                }
                
                let keyboard = KeyboardFileManager.shared.loadUserKeyboard(from: id)
                if let keyboard = keyboard {
                    activeKeyboards[keyboard.id] = (system: false, data: keyboard)
                }
            }
            NSLog("Loaded keyboards: \(Array(activeKeyboards.values).map { $0.data.name }.joined(separator: ", "))")
        } else {
            NSLog("Keyboards not loaded")
        }
        
        activeKeyboards = [
            "dubeolsik": (system: true, data: dubeolsik),
            "dubeolsikOld": (system: true, data: dubeolsikOld)
        ]

        setMenuItems()
    }

    func setMenuItems() {
        self.menuItems = [homeMenu]
//        self.detailViews = []

        for (key, value) in activeKeyboards {
            let menuItem = MenuItem(label: value.data.name, iconName: "pencil", systemMenu: false, editable: !value.system, identifier: key)
            self.menuItems.append(menuItem)
//            let detailView = DetailView(keyboard: $keyboard)
//            self.detailViews.append(detailView)
        }
        
        if !menuItems.map({ $0.id }).contains(selectedItem.id) {
            guard let keyboardId = selectedItem.identifier else {
                return
            }
            if let menuItemWithSameKeyboardId = menuItems.first(where: { $0.identifier == keyboardId }) {
                selectedItem = menuItemWithSameKeyboardId
            }
        }
    }
    
    func addKeyboard() {
        // TODO
        setMenuItems()
    }
    func deleteKeyboard() {
        // TODO
        setMenuItems()
    }
}

struct PreferencesView: View {
    @StateObject private var viewModel = PreferencesViewModel()
    @State private var navigationPath = NavigationPath()
    @State private var activeKeyboard: Keyboard = dubeolsik
    
    var body: some View {
        NavigationSplitView {
            List(viewModel.menuItems, selection: $viewModel.selectedItem) { item in
                NavigationLink(value: item) {
                    Label(item.label, systemImage: item.iconName)
                }
            }
        } detail: {
//            if let view = viewModel.detailViews.first(where: { $0.keyboard.name == viewModel.selectedItem.label }) {
//                NavigationStack(path: $navigationPath) {
//                    view
//                }
//            } else {
//                Text("Home")
//                    .navigationTitle(Text("Preferences"))
//            }
            if viewModel.selectedItem.systemMenu {
                Text("Home")
                    .navigationTitle(Text("Preferences"))
            } else {
                DetailView(keyboard: activeKeyboard)
            }
        }
        .toolbar {
            ControlGroup {
                Button(action: {}) {
                    Image(systemName: "plus")
                }
                Button(action: {}) {
                    Image(systemName: "plus.square.on.square")
                }
                .disabled(viewModel.selectedItem.systemMenu)
            } label: {
                Label("New", systemImage: "plus")
            }
            Button(action: {}) {
                Label("Remove", systemImage: "trash")
            }
            .disabled(viewModel.selectedItem.systemMenu || viewModel.selectedItem.editable == false)
        }
        .navigationSplitViewColumnWidth(min: 120, ideal: 240, max: 360)
        .frame(minWidth: 640, idealWidth: 960, minHeight: 360, idealHeight: 720, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    PreferencesView()
}
