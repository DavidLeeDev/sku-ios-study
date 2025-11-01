//
//  MyImageView.swift
//  ToolTipView
//
//  Created by 이승준 on 11/1/25.
//

import SwiftUI

struct MyImageView: View {
    var body: some View {
        let imageName = "test"
        Image(imageName)
            .resizable()
            .scaledToFill()
    }
}

#Preview {
    MyImageView()
}
