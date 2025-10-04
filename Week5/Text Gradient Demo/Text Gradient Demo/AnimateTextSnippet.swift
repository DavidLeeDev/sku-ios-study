//
//  AnimateTextSnippet.swift
//  Text Gradient Demo
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct AnimateTextSnippet: View {
    @State private var animated: Bool = true
    var body: some View {
        ZStack {
            Color
                .purple
                .opacity(0.7)
                .ignoresSafeArea()
            VStack(alignment: .leading){
                Text("Animate Font Size")
                    .font(animated ? .largeTitle : .headline)
                    .fontWeight(animated ? .bold : .regular)
                    .foregroundStyle(animated ? .black : .yellow)
                    .multilineTextAlignment(.leading)
                Text("Animate Font Size")
                    .font(animated ? .title : .largeTitle)
                    .fontWeight(animated ? .bold : .thin)
                    .foregroundStyle(animated ? .white : .black)
                    .multilineTextAlignment(.leading)
            }
        }
        .onAppear{
            withAnimation{
                animated.toggle()
            }
        }
    }
}

#Preview {
    AnimateTextSnippet()
}
