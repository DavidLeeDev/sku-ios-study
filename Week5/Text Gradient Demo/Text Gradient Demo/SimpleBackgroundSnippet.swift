//
//  SimpleBackgroundSnippet.swift
//  Text Gradient Demo
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct SimpleBackgroundSnippet: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.7).ignoresSafeArea()
            VStack{
                Text("hello")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
        }

    }
}

#Preview {
    SimpleBackgroundSnippet()
}
