//
//  RotatableCircleView.swift
//  Greetings
//
//  Created by 이승준 on 9/20/25.
//

import SwiftUI

struct RotatableCircleView: View {
    let lineWidth = 15.0
    let diameter = 70.0
    
    @State private var isRotated: Bool = false
    
    var angle: Angle {
        isRotated ? .zero : Angle(degrees: 90)
    }
    
    
    var angularGradient: AngularGradient {
        AngularGradient(gradient: Gradient(colors:[.pink, .purple, .orange, .yellow, .blue, .green, .red]), center: .center, angle: .zero)
    }
    var body: some View {
        Circle()
            .strokeBorder(angularGradient, lineWidth: lineWidth)
            .rotationEffect(angle)
            .frame(width: diameter, height: diameter)
            .onTapGesture {
                withAnimation {
                    isRotated.toggle()
                }
            }
    }
}

#Preview {
    RotatableCircleView()
}
