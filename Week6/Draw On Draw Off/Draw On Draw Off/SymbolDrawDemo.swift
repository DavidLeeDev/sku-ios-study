//
//  ContentView.swift
//  Draw On Draw Off
//
//  Created by 이승준 on 10/10/25.
//

import SwiftUI


struct SymbolDrawDemo: View {
    @State private var speed = 0.5
    var body: some View {
        NavigationStack {
            
            ScrollView {
                VStack(spacing: 16) {
                    DrawOnToggleView(
                        title: "Draw On",
                        effect: .drawOn,
                        speed: speed
                    )
                    DrawOnToggleView(
                        title: "Draw On by Layer",
                        effect: .drawOn.byLayer,
                        speed: speed
                    )
                    DrawOnToggleView(
                        title: "Draw On individually",
                        effect: .drawOn.individually,
                        speed: speed
                    )
                    DrawOnToggleView(
                        title: "Draw On Whole symbol",
                        effect: .drawOn.wholeSymbol,
                        speed: speed
                    )
                    Divider()
                    DrawOffToggleView(
                        title: "Draw Off",
                        effect: .drawOff,
                        speed: speed
                    )
                    DrawOffToggleView(
                        title: "Draw Off by Layer",
                        effect: .drawOff.byLayer,
                        speed: speed
                    )
                    DrawOffToggleView(
                        title: "Draw Off individually",
                        effect: .drawOff.individually,
                        speed: speed
                    )
                    DrawOffToggleView(
                        title: "Draw Off Whole symbol",
                        effect: .drawOff.wholeSymbol,
                        speed: speed
                    )
                    
                    
                }
                .padding(.horizontal)
                .padding(.top)
            }
            .navigationTitle("Draw On and Draw Off")
            .safeAreaInset(edge: .bottom){
                VStack {
                    Divider()
                    Slider(value: $speed, in: 0...100, step: 0.05).padding()
                }
                .background(.ultraThinMaterial)
            }
        }
    }
}

#Preview {
    SymbolDrawDemo()
}
