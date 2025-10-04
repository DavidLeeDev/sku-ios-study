//
//  DefaultViewSnippet.swift
//  Text Gradient Demo
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct DefaultViewSnippet: View {
    @State private var msg: String = "Hello, world!"
    let imageName: String = "Google - Original"
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.blue)
            Text(msg)
            
            Spacer()
            
            VStack{
                Button(action: {
                    print("Button 1 pressed")
                    msg = "Sign up with Google"
                }, label: {
                    HStack {
                        Image(imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                        
                        Text("Sign up with Google")
                    }
                    .foregroundStyle(.black)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 15).stroke(Color.black)
                    )
                    .padding(.horizontal)
                })
            }
        }
    }
}

#Preview {
    DefaultViewSnippet()
}
