//
//  BlendedCircleView.swift
//  Explore Blur Effect
//
//  Created by 이승준 on 9/27/25.
//

import SwiftUI

struct BlendedCircleView: View {
    let color: Color
    let radius: Double
    let offsetX: Double
    let offsetY: Double
    let blurRadius: Double
    let blendMode: BlendMode
    var body: some View {
        Circle().fill(color)
            .frame(width: radius, height: radius)
            .offset(x: offsetX, y: offsetY)
            .blur(radius: blurRadius)
            .blendMode(blendMode)
    }
}

#Preview {
    BlendedCircleView(
        color: .red,
        radius: 50,
        offsetX: 100,
        offsetY: -100,
        blurRadius: 10,
        blendMode: .normal
    )
}
