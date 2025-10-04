//
//  ContentView.swift
//  Image Exploration
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .onAppear{
                    for i in 1...48 {
                        print("\tcase img\(i)")
                    }
                }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
