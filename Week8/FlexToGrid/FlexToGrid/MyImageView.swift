//
//  MyImageView.swift
//  FlexToGrid
//
//  Created by 이승준 on 11/1/25.
//

import SwiftUI

struct MyImageView: View {
    let imageName: String
    var body: some View {
        Image(imageName)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

#Preview {
    MyImageView(imageName: "name")
}
