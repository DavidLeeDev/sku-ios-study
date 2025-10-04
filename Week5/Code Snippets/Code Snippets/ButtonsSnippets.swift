//
//  ButtonsSnippets.swift
//  Code Snippets
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct ButtonsSnippets: View {
    var body: some View {
        VStack{
            Text("Buttons")
            Button(action: {
                print("Button pressed")
            }, label: {
                Text("Button pressed")
                    .padding()
                    .foregroundStyle(.white)
                    .background(
                        Capsule()
                            .fill(Color.gray)
                    )
            })
            
            Button(action: {
                print("Button pressed")
            }, label: {
                Text("Button Pressed")
                    .padding()
                    .foregroundStyle(.blue)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.yellow)
                    )
            })
            
           
            LinearGradient(colors: [.blue, .yellow], startPoint: .leading, endPoint: .trailing)
                .mask(
                    Text("Text with gradients")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                )
        }
    }
}

#Preview {
    ButtonsSnippets()
}
