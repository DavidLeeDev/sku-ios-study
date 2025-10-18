//
//  RotateGestureStoreState.swift
//  Gestures Exploration
//
//  Created by 이승준 on 10/17/25.
//

import SwiftUI

struct RotateGestureStoreState: View {
    @Binding var rotation: Double
    @State private var currentRotation: Double = 0.0
    
    var totalRotation: Double {
        currentRotation + rotation
    }
    
    var body: some View {
        NavigationStack {
            NiceTextView(
                text: "Hello, World!",
                bgColor: .black,
                fgColor: .orange,
                radius: 10
            )
            .rotationEffect(Angle(degrees: totalRotation))
            .gesture(
                RotationGesture()
                    .onChanged{
                        value in
                        currentRotation = value.degrees
                    }
                    .onEnded{
                        _ in
                        withAnimation(.spring){
                            rotation+=currentRotation
                            
                            currentRotation = 0
                        }
                    }
            )
            .onTapGesture {
                withAnimation(.spring()){
                    rotation = 0
                    currentRotation = 0
                }
            }
            .navigationTitle("Rotation Demo Store State")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    RotateGestureStoreState(rotation: .constant(0))
}
