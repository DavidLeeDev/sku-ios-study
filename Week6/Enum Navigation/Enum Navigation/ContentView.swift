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
                        Text("Profile View")
                    case .settings:
                        Text("Settings View")
                    case .intScreen(let value):
                        Text("View \(value)")
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
