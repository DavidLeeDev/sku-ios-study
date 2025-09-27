//
//  ContentView.swift
//  Exploring Blend Mode
//
//  Created by 이승준 on 9/27/25.
//

import SwiftUI

struct BlendDemoView: View {
    @State private var opacity = 0.2
    let blendModels: [BlendModel] = [
        .init(blendMode: .normal, title: "Normal", describe: "This is the standard blend mode"),
        .init(blendMode: .color, title: "Color", describe: "The Color blend mode preserves the luma of the bottom layer")
    ]
    var sortedBlendModels: [BlendModel] {
        blendModels.sorted{
            lhs, rhs in lhs.title < rhs.title
        }
    }
    var body: some View {
        VStack {
            Text("Blend Mode in SwiftUI")
                .font(.title)
            
            Form{
                ForEach(sortedBlendModels) { blendModel in
                    BlendModeView(blendModel: blendModel, opacity: opacity)
                }
            }
            
            Slider(value: $opacity, in: 0...1)
                .tint(.purple)
                .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    BlendDemoView()
}
