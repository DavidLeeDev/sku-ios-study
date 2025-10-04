//
//  RandomBackgroundSnippet.swift
//  Text Gradient Demo
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct RandomBackgroundSnippet: View {
    @State private var screenColor = Color.blue
    var body: some View {
        ZStack {
            screenColor.opacity(0.7).ignoresSafeArea()
            
            VStack {
                Text("Tap Screen")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.1)
                    .padding()
            }
            
        }.onTapGesture {
            withAnimation{
                screenColor = randomColor(oldColor: screenColor)
            }
        }
    }
    
    func randomColor(oldColor: Color) -> Color {
        let colorList: [Color] = [
            .yellow, .purple, .pink, .blue, .cyan, .red, .blue, .green, .indigo
        ]
        var newColor: Color
        
        repeat {
            let index = Int.random(in: 0..<colorList.count)
            newColor = colorList[index]
        } while (newColor == oldColor)
        
        let index = Int.random(in: 0..<colorList.count)
        
        newColor = colorList[index]
        
        return newColor
    }
}

#Preview {
    RandomBackgroundSnippet()
}
