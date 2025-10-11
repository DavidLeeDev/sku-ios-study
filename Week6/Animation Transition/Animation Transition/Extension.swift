//
//  Extension.swift
//  Animation Transition
//
//  Created by 이승준 on 10/11/25.
//

import SwiftUI

extension AnyTransition {
    static var rotatingScale: AnyTransition {
        AnyTransition
            .modifier(
                active: RotatingScaleModifier(
                    angle: 90,
                    scale: 0.1,
                    opacity: 0
                ),
                identity: RotatingScaleModifier(
                    angle: 0,
                    scale: 1,
                    opacity: 1
                )
            )
    }
    
    static var flipFromTop: AnyTransition {
        AnyTransition.modifier(
            active: FlipModifier(angle: -90, opacity: 0),
            identity: FlipModifier(angle: 0, opacity: 1)
        )
    }
    
    static var scaleAndBlur: AnyTransition{
        AnyTransition
            .modifier(
                active: ScaleAndBlur(
                    scale: 0.3,
                    blurRadius: 10,
                    opacity: 0
                ),
                identity: ScaleAndBlur(
                    scale: 1,
                    blurRadius: 0,
                    opacity: 1
                )
            )
    }
}

struct RotatingScaleModifier: ViewModifier {
    let angle: Double
    let scale: Double
    let opacity: Double
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(angle))
            .scaleEffect(scale)
            .opacity(opacity)
    }
}

struct FlipModifier: ViewModifier {
    let angle: Double
    let opacity: Double
    
    func body (content: Content) -> some View {
        content
            .rotation3DEffect(
                .degrees(angle),
                axis: (x: 1, y: 0, z: 0)
            )
            .opacity(opacity)
    }
}

struct ScaleAndBlur: ViewModifier {
    let scale: CGFloat
    let blurRadius: CGFloat
    let opacity: Double
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(scale)
            .blur(radius: blurRadius)
            .opacity(opacity)
    }
}
