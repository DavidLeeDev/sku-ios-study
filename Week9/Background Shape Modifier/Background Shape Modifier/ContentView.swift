//
//  ContentView.swift
//  Background Shape Modifier
//
//  Created by 이승준 on 11/8/25.
//

import SwiftUI

struct BackgroundShapeModifier<S>: ViewModifier where S: Shape {
    var color: Color
    var shape: S
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(color)
            .clipShape(shape)
    }
}

extension View {
    func backgroundShape<S: Shape>(color: Color, shape: S)->some View {
        self
            .modifier(
                BackgroundShapeModifier(
                    color: color,
                    shape: shape
                    )
                )
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello")
                .backgroundShape(color: .red, shape: .rect(cornerRadius: 30))
            Text("Hello, world!")
                .modifier(
                    BackgroundShapeModifier(
                        color: .blue,
                        shape: .rect(
                            cornerRadius: 20
                        )
                    )
                )
            Text("Hello, world!")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                .clipShape(.rect(cornerRadius: 5))
            Text("Hello, world!")
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.purple)
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 0,
                        bottomLeadingRadius: 30,
                        bottomTrailingRadius: 0,
                        topTrailingRadius: 30,
                        style: .continuous
                    )
                )
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
