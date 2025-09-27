//
//  TabSectionExample.swift
//  Exploring Tab View
//
//  Created by 이승준 on 9/27/25.
//

import SwiftUI

struct TabSectionExample: View {
    var body: some View {
        TabView {
            Tab("Watch", systemImage: "play") {
                Text("Watch View")
            }
            Tab("Sleep", systemImage: "sleep.circle") {
                Text("Sleep View")
            }
            TabSection("Collections"){
                Tab("Watch", systemImage: "play") {
                    Text("Watch View")
                }
                Tab("Sleep", systemImage: "sleep.circle") {
                    Text("Sleep View")
                }
            }
            TabSection("Hobbies") {
                Tab("Tab 1", systemImage: "person") {
                    Text("Tab 1 View")
                }
                Tab("Tab 2", systemImage: "trash") {
                    Text("Tab 2 View")
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable)
    }
}

#Preview {
    TabSectionExample()
}
