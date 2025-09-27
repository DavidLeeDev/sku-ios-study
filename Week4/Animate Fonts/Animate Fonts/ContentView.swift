//
//  ContentView.swift
//  Animate Fonts
//
//  Created by 이승준 on 9/24/25.
//

import SwiftUI

struct ContentView: View {
    @State private var largeFont = true
    var font: Font {
        largeFont ? .largeTitle : .caption
    }
    var body: some View {
        ZStack {
            Color
                .purple
                .opacity(0.7)
                .ignoresSafeArea()
            VStack {
                Spacer()
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                    .font(font)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    withAnimation{
                        largeFont.toggle()
                    }
                } label: {
                    Text("Click Me")
                        .font(.title)
                        .fontWeight(.semibold)
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
