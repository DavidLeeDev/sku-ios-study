//
//  ContentView.swift
//  Zoom Transition
//
//  Created by 이승준 on 10/10/25.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var namespace
    
    var body: some View {
        NavigationStack {
            NavigationLink{
                ZStack {
                    Color.cyan.opacity(0.3).ignoresSafeArea()
                    Text("Destination View")
                        .font(.title)
                        .navigationTransition(.zoom(sourceID: "idHello", in: namespace))
                }
            } label: {
                Text("Hello, world!")
                    .font(.largeTitle)
                    .bold()
                    .fontWidth(.expanded)
                    .matchedTransitionSource(id: "idHelloWorld", in: namespace)
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
