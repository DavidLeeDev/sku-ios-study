//
//  ColorCircle.swift
//  Binding Example
//
//  Created by 이승준 on 10/3/25.
//

import SwiftUI

struct ColorCircle: View {
    let color: Color
    let isSelected: Bool
    
    let selectedDim = 30.0
    let notSelectedDim = 20.0
    
    var dim: CGFloat {
        isSelected ? selectedDim : notSelectedDim
    }
    
    var body: some View {
        Circle()
            .fill(color)
            .frame(width: dim, height: dim)
    }
}

#Preview {
    ColorCircle(color: .blue, isSelected: true)
    ColorCircle(color: .red, isSelected: false)
}
