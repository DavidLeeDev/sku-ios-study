//
//  SliderTextView.swift
//  Explore Blur Effect
//
//  Created by 이승준 on 9/27/25.
//

import SwiftUI

struct SliderTextView: View {
    @Binding var value: Double
    let min: Double
    let max: Double
    let text: String
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            Text("\(text.capitalized): \(value.formatted())")
                .fontWeight(.semibold)
                .font(.headline)
            Slider(value: $value, in : min...max, step: 1)
                .tint(color)
        }
    }
}

#Preview {
    SliderTextView(value: .constant(15), min: 0, max: 50, text: "Red Blur Effect", color: .red)
}
