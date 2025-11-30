//
//  HaneulIMESettingsApp.swift
//  HaneulIMESettings
//
//  Created by 강우현 on 11/27/25.
//

import SwiftUI

@main
struct HaneulIMESettingsApp: App {
    @StateObject private var appEnvironment = AppEnvironment()
    
    var body: some Scene {
        Window("Some", id: "how") {
            ContentView()
                .environmentObject(appEnvironment)
        }
    }
}
