//
//  ContentView.swift
//  Code Snippets
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTab = "One"
    var body: some View {
        ZStack {
            Color.blue.opacity(0.3).ignoresSafeArea()
            
            TabView(selection: $selectedTab) {
                Text("Hello")
                    .tag("One")
                
                Text("Good morning")
                    .tag("Two")
                Text("Good afternoon")
                    .tag("Three")
                Text("Good evening")
                    .tag("Fouur")
            }
            
            .ignoresSafeArea()
        }

    }
}

#Preview {
    ContentView()
}
