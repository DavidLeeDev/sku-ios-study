//
//  AllGestureDemo.swift
//  Gestures Exploration
//
//  Created by 이승준 on 10/17/25.
//

import SwiftUI

struct AllGestureDemo: View {
    @State private var offset: CGSize = .zero
    @State private var rotation = 0.0
    @State private var scale = 1.0
    
    var body: some View {
        NavigationStack {
            NiceTextView(
                text: "Hello World!",
                bgColor: .black,
                fgColor: .orange,
                radius: 10
            )
            .offset(offset)
            .rotationEffect(Angle(degrees: rotation))
            .scaleEffect(scale)
            .gesture(
                SimultaneousGesture(SimultaneousGesture(
                    DragGesture()
                    .onChanged{
                    value in
                        offset = value.translation
                    }
                    .onEnded{
                        value in
                        withAnimation(.spring()){
                            offset = .zero
                        }
                    },
                    MagnificationGesture()
                    .onChanged{
                    value in
                        scale = value
                    }
                    .onEnded{
                        value in
                        withAnimation(.spring()){
                            scale = 1.0
                        }
                    }), RotationGesture().onChanged({
                        value in
                        rotation = value.degrees
                    }).onEnded{_ in
                        withAnimation(.spring()){
                            rotation = 0.0
                        }
                    }
                )
            )
            .navigationTitle("Rotate, Drag, Magnify")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    AllGestureDemo()
}
