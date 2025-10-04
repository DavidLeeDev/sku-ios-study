//
//  ImageLinkSnippet.swift
//  Text Gradient Demo
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct ImageLinkSnippet: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.7).ignoresSafeArea()
            
            if let url = URL(string: "https://images.pexels.com/photos/33435611/pexels-photo-33435611.jpeg") {
                Link(destination: url, label: {
                    let imageDim: CGFloat = 300
                    
                    Image("img1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageDim, height: imageDim)
                })
            }
        }
    }
}

#Preview {
    ImageLinkSnippet()
}
