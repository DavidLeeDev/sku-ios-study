//
//  RectangleView.swift
//  Binding Example
//
//  Created by 이승준 on 10/3/25.
//

import SwiftUI

struct RectangleView: View {
    let dim: CGFloat
    let color: Color
    init(dim: CGFloat = 50, color: Color) {
        self.dim = dim
        self.color = color
    }
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(color)
            .frame(width: dim, height: dim)
    }
}

#Preview {
    RectangleView(color: .blue)
}
