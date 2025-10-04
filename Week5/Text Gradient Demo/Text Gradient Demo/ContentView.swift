//
//  ContentView.swift
//  Text Gradient Demo
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct ContentView: View {
    let colorList: [Color]
    var body: some View {
        SomeText()
            .overlay(
                LinearGradient(colors: colorList, startPoint: .leading, endPoint: .trailing)
                    .mask(
                        SomeText()
                    )
            )
    }
}

struct SomeText: View {
    var body: some View {
        Text("Great Gravy Gradienting!")
            .font(.largeTitle)
            .fontWeight(.bold)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    VStack {
        ContentView(colorList: [.yellow, .black.opacity(0.85), .orange])
        ContentView(colorList: [.white, .black.opacity(0.85), .blue])
    }
}
