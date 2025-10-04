//
//  ImageExampleExplore2.swift
//  Image Exploration
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct ImageExampleExplore2: View {
    @State private var scaleToFit = true
    var body: some View {
        Image(ImgType.imgLightening1.rawValue)
            .resizable()
            .aspectRatio(contentMode: scaleToFit ? .fit : .fill)
            .cornerRadius(20)
            .padding()
            .onTapGesture {
                withAnimation{
                    scaleToFit.toggle()
                }
            }
    }
}

#Preview {
    ImageExampleExplore2()
}
