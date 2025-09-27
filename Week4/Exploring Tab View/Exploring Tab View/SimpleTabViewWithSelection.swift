//
//  SimpleTabViewWithSelection.swift
//  Exploring Tab View
//
//  Created by 이승준 on 9/27/25.
//

import SwiftUI

enum WatchType {
    case watch, sleep, browse
}

struct SimpleTabViewWithSelection: View {
    @State private var selectedTab: WatchType = .watch
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Watch", systemImage: "play", value: .watch) {
                Text("Watch View")
            }
            Tab("Sleep", systemImage: "sleep.circle", value: .sleep) {
                Text("Sleep View")
            }
            Tab("Browse", systemImage: "square.grid.2x2", value: .watch) {
                Text("Browse View")
            }
        }.tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    SimpleTabViewWithSelection()
}
