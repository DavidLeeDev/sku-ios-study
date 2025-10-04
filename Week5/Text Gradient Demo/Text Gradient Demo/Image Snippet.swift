//
//  Image Snippet.swift
//  Text Gradient Demo
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct Image_Snippet: View {
    var body: some View {
        Image("img1")
            .resizable()
            .clipShape(Circle())
            .shadow(radius: 10)
            .overlay(
                Circle().stroke(Color.blue, lineWidth: 3)
            )
    }
}

#Preview {
    Image_Snippet()
}
