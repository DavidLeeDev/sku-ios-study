//
//  ContentView.swift
//  Previewable Example
//
//  Created by 이승준 on 9/27/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
//    ContentView()
    @Previewable @State var isOn: Bool = false
    let msg = isOn ? "Disable animations" : "Enable animations"
    
    Toggle(isOn: $isOn, label: {
        Text(msg).font(.title)
    }).padding()
}
