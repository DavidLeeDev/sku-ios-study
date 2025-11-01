//
//  TestIndicatorView.swift
//  Gradient Indicator
//
//  Created by 이승준 on 11/1/25.
//

import SwiftUI

struct TestIndicatorView: View {
    @State private var percentage: CGFloat = 0.7
    var body: some View {
        VStack{
            Text("Gradient Indicator")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()
            Spacer()
            IndicatorView(
                width: 200,
                height: 30,
                percentage: percentage,
                color: .gray
            )
            Spacer()
            Slider(value: $percentage)
                .padding()
        }
    }
}

#Preview {
    TestIndicatorView()
}
