//
//  ScaleTransitionView.swift
//  Animation Transition
//
//  Created by 이승준 on 10/11/25.
//

import SwiftUI

struct ScaleBlurTransitionView: View {
    @State private var show = true
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                Spacer()
                
                if show{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.green.gradient)
                        .frame(width: 200, height: 200)
                        .overlay(content: {
                            Text("Scale Blur Transition")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.white)
                        })
                        .transition(.scaleAndBlur)
                }
                
                Spacer()
                
                Button(show ? "Hide" : "Show") {
                    withAnimation{
                        show.toggle()
                    }
                }.buttonStyle(.borderedProminent)
            }
        }.navigationTitle("Scale and Blur Transition")
    }
}

#Preview {
    ScaleBlurTransitionView()
}
