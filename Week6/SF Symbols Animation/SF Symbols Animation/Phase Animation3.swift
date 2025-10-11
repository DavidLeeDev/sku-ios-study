//
//  Phase Animation3.swift
//  SF Symbols Animation
//
//  Created by 이승준 on 10/10/25.
//

import SwiftUI

struct Phase_Animation3: View {
    @State private var animateMe : Bool = false
    var body: some View {
        VStack {
            Spacer()
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .phaseAnimator(Phase.allCases, trigger: animateMe) {
                    view,phase in view
                        .font(phase == .middle ? .subheadline : .largeTitle)
                        .blur(radius: phase == .end ? 10 : 0)
                        .foregroundStyle(phase == .middle ? .red : .blue)
                }
            Spacer()
            
            Button(action: {
                animateMe.toggle()
            }, label: {
                Text(animateMe ? "Stop" : "Play")
            })
        }
    }
}

enum Phase : CaseIterable{
    case start, middle, end
}

#Preview {
    Phase_Animation3()
}
