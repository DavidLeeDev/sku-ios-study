//
//  ContentView.swift
//  Animation Transition
//
//  Created by 이승준 on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form{
                Section("Built-in Transtions"){
                    NavigationLink("Move Transition"){
                        MoveTransitionView()
                    }
                    NavigationLink("Slide Transition"){
                        SlideTransitionView()
                    }
                    NavigationLink("Asymmetric Transition"){
                        AsymmetricTransitionView()
                    }
                    NavigationLink("Combined Transition"){
                        CombinedTransitionView()
                    }
                }
                Section("Custom Transtions"){
                    NavigationLink("Rotating and Scale") {
                        RotateScaleView()
                    }
                    NavigationLink("Flip from Top") {
                        FlipTransitionView()
                    }
                    NavigationLink("Scale and Blur") {
                        ScaleBlurTransitionView()
                    }
                }
            }
            .navigationTitle("Transitions")
        }
    }
}



#Preview {
    ContentView()
}
