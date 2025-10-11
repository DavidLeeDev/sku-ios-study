//
//  ContentView.swift
//  Navigation Destination
//
//  Created by 이승준 on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List(1..<10) { item in
//                NavigationLink("Item \(item)") {
//                    DetailView(item: item)
//                }
                NavigationLink("Item \(item)", value: item)
            }
            .navigationDestination(for: Int.self, destination: { item in
                DetailView(item: item)
            })
            .navigationTitle("Items")
        }
    }
}

struct DetailView: View {
    let item: Int
    init(item: Int) {
        self.item = item
        print("Initializing item: \(item)")
    }
    var body: some View {
        Text("Selected Item: \(item)")
            .font(.title)
    }
}

#Preview {
    ContentView()
}
