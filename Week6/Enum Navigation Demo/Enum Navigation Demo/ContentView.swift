//
//  ContentView.swift
//  Enum Navigation
//
//  Created by 이승준 on 10/11/25.
//

import SwiftUI

enum Screen: Hashable {
    case profile
    case settings
    case intScreen(Int)
}

struct ContentView: View {
    @State private var path: [Screen] = []
    var body: some View {
        NavigationStack(path: $path){
            List{
                Button("Go to Profile"){
                    path.append(.profile)
                }
                Button("Go to Settings"){
                    path.append(.settings)
                }
                Button("Go to Random Int View"){
                    let randomInt = Int.random(in: 1...100)
                    path.append(.intScreen(randomInt))
                }
            }.navigationTitle("Home")
                .navigationDestination(for: Screen.self){
                    screen in
                    switch screen {
                    case .profile:
                        ProfileView(path: $path)
                    case .settings:
                        SettingsView()
                    case .intScreen(let value):
                        IntView(value: value, path: $path)
                    }
                }
        }
    }
}

struct SettingsView: View {
    var body: some View {
        Text("Settings Screen")
            .font(.title)
            .navigationTitle("Settings")
        
    }
}
struct ProfileView: View {
    @Binding var path: [Screen]
    var body: some View {
        VStack {
            Text("Profile Screen")
                .font(.title)
                
            Button("Go to Random Int View"){
                let randomInt = Int.random(in: 1...100)
                path.append(.intScreen(randomInt))
            }
            .padding()
            Button("Back to Home"){
                path = []
            }.foregroundStyle(.red)
                .padding()
        }
        .navigationTitle("Profile")
        .navigationBarBackButtonHidden()
    }
}

struct IntView: View {
    let value: Int
    @Binding var path: [Screen]
    var body: some View {
        VStack {
                
            Button("Go to Random Int View"){
                let randomInt = Int.random(in: 1...100)
                path.append(.intScreen(randomInt))
            }
            
            Button("Back to Home"){
                path = []
            }.foregroundStyle(.red)
                .padding()
        }
        .navigationTitle("Int View: \(value)")
        
    }
}
#Preview {
    ContentView()
}
