//
//  TextWithBackgroundView.swift
//  Toast Modifier
//
//  Created by 이승준 on 11/8/25.
//

import SwiftUI

struct TextWithBackgroundView: View {
    let text: String
    let color: Color
    let textColor: Color
    
    init(text: String, color: Color = .black.opacity(0.8), textColor: Color = .white) {
        self.text = text
        self.color = color
        self.textColor = textColor
    }
    
    var body: some View {
        Text(text)
            .padding(.horizontal, 20)
            .padding(.vertical, 10)
            .foregroundStyle(textColor)
            .background(
                Capsule().fill(color)
            )
            .shadow(color: color, radius: 5, x: 0, y: 3)
    }
}

#Preview {
    TextWithBackgroundView(
        text: "My Text"
    )
}
