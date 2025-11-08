//
//  ContentView.swift
//  GradientBorderShadowDemo
//
//  Created by 이승준 on 11/8/25.
//

import SwiftUI

struct GradientBorderShadowDemo: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .font(.largeTitle)
                .padding()
                .gradientBorderAndShadow(
                    gradient: LinearGradient(colors: [.red, .blue], startPoint: .leading, endPoint: .trailing),
                    borderWidth: 3
                )
        }
        .padding()
    }
}

struct RoundedCornerGradientShadow: ViewModifier {
    let radius: CGFloat
    let gradient: LinearGradient
    let shadowColor: Color
    let shadowRadious: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay {
                RoundedRectangle(cornerRadius: radius)
                    .stroke(gradient, lineWidth: 4)
            }
            .shadow(color: shadowColor, radius: shadowRadious)
    }
}
extension View {
    func gradientBorderAndShadow(gradient: LinearGradient, borderWidth: CGFloat) -> some View {
        self.modifier(
            RoundedCornerGradientShadow(
                radius: 12,
                gradient: gradient,
                shadowColor: .gray.opacity(0.6),
                shadowRadious: 6
            )
        )
    }
}
#Preview {
    GradientBorderShadowDemo()
}
