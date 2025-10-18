//
//  Squares.swift
//  Gestures Exploration
//
//  Created by 이승준 on 10/17/25.
//

import SwiftUI

struct Squares: View {
    let opacity: CGFloat
    
    init(opacity: CGFloat = 0.85) {
        self.opacity = opacity
    }
    var body: some View {
        Grid{
            SquaresRow(colors: [.red, .green, .blue])
            SquaresRow(colors: [.yellow, .indigo, .cyan])
            SquaresRow(colors: [.brown, .orange, .gray])
        }
        .opacity(opacity)
    }
}

#Preview {
    Squares()
}
