//
//  ContentView.swift
//  Breathe Rotate Wiggle Effects
//
//  Created by 이승준 on 10/10/25.
//

import SwiftUI

struct ContentView: View {
    let symbols: [String] = ["leaf.arrow.trianglehead.clockwise", "square.and.arrow.up", "accessibility"]
    @State private var index = 0
    var currentSymbol: String {
        symbols[index]
    }
    @State private var breathe = false
    @State private var rotate = false
    @State private var wiggle = false
    
    var body: some View {
        VStack {
            Form{
                Section("Breathe"){
                    Button("Breathe", action: {breathe.toggle()})
                    HStack {
                        SFSymbolView(text: currentSymbol)
                            .symbolEffect(.breathe.pulse.byLayer, value: breathe)
                        SFSymbolView(text: currentSymbol)
                            .symbolEffect(.breathe.pulse.wholeSymbol, value: breathe)
                        SFSymbolView(text: currentSymbol)
                            .symbolEffect(.breathe.plain, value: breathe)
                    }
                }
                Section("Rotate"){
                    Button("Rotate", action: {rotate.toggle()})
                    HStack {
                        SFSymbolView(text: currentSymbol)
                            .symbolEffect(.rotate.counterClockwise.byLayer, value: rotate)
                        SFSymbolView(text: currentSymbol)
                            .symbolEffect(.rotate.clockwise, value: rotate)
                    }
                }
                Section("Wiggle"){
                    Button("Wiggle", action: {wiggle.toggle()})
                    HStack {
                        SFSymbolView(text: currentSymbol)
                            .symbolEffect(.wiggle.backward.byLayer, value: wiggle)
                        SFSymbolView(text: currentSymbol)
                            .symbolEffect(.wiggle.left.byLayer, value: wiggle)
                        SFSymbolView(text: currentSymbol)
                            .symbolEffect(.wiggle.right.wholeSymbol, value: wiggle)
                    }
                }
            }
            
            Button("Change Symbol"){
                index += 1
                index %= symbols.count
            }
        }
    }
}

#Preview {
    ContentView()
}
