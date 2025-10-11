//
//  Phase Animations2.swift
//  SF Symbols Animation
//
//  Created by 이승준 on 10/10/25.
//

import SwiftUI

struct Phase_Animations2: View {
    var body: some View {
        ZStack{
            LinearGradient(colors: [.yellow, .green], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.3)
                .ignoresSafeArea()
            
            Image("fruit")
                .resizable()
                .scaledToFit()
                .phaseAnimator([0,10,15,3]){view, phase in
                    view
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(lineWidth: phase)
                        )
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
        }
    }
}

#Preview {
    Phase_Animations2()
}
