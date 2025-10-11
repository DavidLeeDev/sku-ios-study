//
//  CustomTransitionView.swift
//  Animation Transition
//
//  Created by 이승준 on 10/11/25.
//

import SwiftUI

struct RotateScaleView: View {
    @State private var show = true
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                Spacer()
                
                if show{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.purple.gradient)
                        .frame(width: 200, height: 200)
                        .transition(.rotatingScale)
                }
                
                Spacer()
                
                Button(show ? "Hide" : "Show") {
                    withAnimation{
                        show.toggle()
                    }
                }.buttonStyle(.borderedProminent)
            }
        }.navigationTitle("Rotating Scale Transition")
    }
}

#Preview {
    RotateScaleView()
}


