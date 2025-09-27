//
//  MyImageView.swift
//  Scroll Transition Visual Effects
//
//  Created by 이승준 on 9/27/25.
//

import SwiftUI

struct MyImageView: View {
    let name: String
    let maxWidth: CGFloat?
    
    init(name: String, maxWidth: CGFloat? = nil) {
        self.name = name
        self.maxWidth = maxWidth
    }
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 20))
            .padding()
            .frame(maxWidth: maxWidth)
    }
}

#Preview {
    MyImageView(name: "tree")
}
