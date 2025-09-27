//
//  BlendModeView.swift
//  Exploring Blend Mode
//
//  Created by 이승준 on 9/27/25.
//

import SwiftUI

struct BlendModeView: View {
    let blendModel: BlendModel
    let opacity: Double
    let dim = 150.0
    
    var offset: CGFloat{
        dim / 3
    }
    
    var rectDim: CGFloat {
        1.75 * dim
    }
    
    var body: some View {
        VStack {
            Text(blendModel.title).font(.headline).padding(.top)
            
            ZStack{
                Circle()
                    .fill(Color.blue)
                    .frame(width: dim, height: dim)
                    .offset(x: -offset)
                Circle()
                    .fill(Color.red)
                    .frame(width: dim, height: dim)
                    .offset(x: offset)
                Circle()
                    .fill(Color.yellow)
                    .frame(width: dim, height: dim)
                    .offset(y: offset)
            }
            .blendMode(blendModel.blendMode)
            .padding()
            .frame(width: rectDim, height: rectDim)
            .background(Color.black.opacity(opacity))
            .clipShape(.rect(cornerRadius: 15))
            .overlay{
                RoundedRectangle(cornerRadius: 15)
                    .stroke(lineWidth: 0.5)
            }
            Text(blendModel.describe)
        }
    }
}

#Preview {
    VStack {
        BlendModeView(blendModel: .init(blendMode: .normal, title: "Normal", describe: "This is the standard blend mode"), opacity: 0.5)
        BlendModeView(blendModel: .init(blendMode: .color, title: "Color", describe: "The Color blend mode preserves the luma of the bottom layer"), opacity: 0.5)
            
    }
}
