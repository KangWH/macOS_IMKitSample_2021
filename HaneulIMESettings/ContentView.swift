//
//  ContentView.swift
//  HaneulIMESettings
//
//  Created by 강우현 on 11/27/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appEnvironment: AppEnvironment
    
    var body: some View {
        SettingsView()
            .environmentObject(appEnvironment)
    }
}

#Preview {
    let sampleData = AppEnvironment()
    ContentView()
        .environmentObject(sampleData)
}
