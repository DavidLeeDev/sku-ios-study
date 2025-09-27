//
//  ContentView.swift
//  Group Box Example
//
//  Created by 이승준 on 9/27/25.
//

import SwiftUI

struct SettingsView: View {
    @State private var enableNotifications = true
    @State private var darkMode = false
    var body: some View {
        GroupBox(
            content: {
                VStack(alignment: .leading){
                    Toggle("Enable Notifications", isOn:$enableNotifications)
                    Toggle("Dark Mode", isOn: $darkMode)
                }
            },
            label: {
                Label("Settings", systemImage: "gearshape")
            }
        )
    }
}

#Preview {
    SettingsView()
}
