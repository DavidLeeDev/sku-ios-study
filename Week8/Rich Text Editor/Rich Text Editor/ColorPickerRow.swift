//
//  ColorPickerRow.swift
//  Rich Text Editor
//
//  Created by 이승준 on 10/31/25.
//

import SwiftUI

struct ColorPickerRow: View {
    let title: String
    let colors: [Color]
    let action: (Color) -> Void
    
    let dim: CGFloat = 28.0
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
            HStack(spacing: 12){
                ForEach(colors, id: \.self){
                    color in
                    Button{
                        action(color)
                    } label: {
                        Circle()
                            .fill(color)
                            .frame(width: dim, height: dim)
                            .overlay{
                                Circle()
                                    .stroke(Color.primary.opacity(0.2))
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    ColorPickerRow(
        title: "Background Colors",
        colors: [.red.opacity(0.2), .blue.opacity(0.2), .green.opacity(0.2)],
        action: {_ in }
    )
}
