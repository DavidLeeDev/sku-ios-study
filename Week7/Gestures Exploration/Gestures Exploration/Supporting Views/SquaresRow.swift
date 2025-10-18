//
//  SquaresRow.swift
//  Gestures Exploration
//
//  Created by 이승준 on 10/17/25.
//

import SwiftUI

struct SquaresRow: View {
    let colors: [Color]
    let dim: CGFloat
    let cornerRadius: CGFloat
    
    init(colors: [Color], dim: CGFloat = 50, cornerRadius: CGFloat = 5) {
        self.colors = colors
        self.dim = dim
        self.cornerRadius = cornerRadius
    }
    var body: some View {
        GridRow {
            ForEach(colors, id: \.self){
                color in
                color.frame(width: dim, height: dim)
                    .clipShape(.rect(cornerRadius: cornerRadius))
                    
            }
        }
    }
}

struct GradientBackground: View {
    let colors: [Color]
    let opacity: CGFloat
    init(colors: [Color], opacity: CGFloat) {
        self.colors = colors
        self.opacity = opacity
    }
    
    var body: some View {
        LinearGradient(colors: colors, startPoint: .topLeading, endPoint: .bottomTrailing)
            .opacity(opacity)
            .ignoresSafeArea()
    }
}

#Preview {
    ZStack {
        GradientBackground(colors: [.yellow, .indigo, .cyan], opacity: 0.4)
    
        Grid {
            ForEach(0..<10) { item in
                SquaresRow(colors: [.red, .green, .blue],
                           dim: CGFloat(item) * 5.0)
            }
            ForEach(0..<10) { item in
                SquaresRow(colors: [.red, .green, .blue],
                           dim: CGFloat(10-item) * 5.0)
            }
        }
    }
}
