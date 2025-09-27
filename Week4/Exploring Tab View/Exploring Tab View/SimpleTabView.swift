//
//  ContentView.swift
//  Exploring Tab View
//
//  Created by 이승준 on 9/27/25.
//

import SwiftUI

struct SimpleTabView: View {
    var body: some View {
        TabView{
            Tab("Watch", systemImage: "play") {
                Text("Watching something")
            }
            Tab("Read", systemImage: "book.pages.fill") {
                Text("Reading a book")
            }
            Tab(role: .search){
                Text("Search this App...")
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    SimpleTabView()
}
