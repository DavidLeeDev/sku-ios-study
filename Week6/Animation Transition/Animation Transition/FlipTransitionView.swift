//
//  FlipTransitionView.swift
//  Animation Transition
//
//  Created by 이승준 on 10/11/25.
//


import SwiftUI

struct FlipTransitionView: View {
    @State private var show = true
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                Spacer()
                
                if show{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.mint.gradient)
                        .frame(width: 200, height: 200)
                        .overlay(content: {
                            Text("Flip")
                                .font(.largeTitle)
                                .bold()
                                .foregroundStyle(.white)
                        })
                        .transition(.flipFromTop)
                }
                
                Spacer()
                
                Button(show ? "Hide" : "Show") {
                    withAnimation{
                        show.toggle()
                    }
                }.buttonStyle(.borderedProminent)
            }
        }.navigationTitle("Flip From Top Transition")
    }
}

#Preview {
    FlipTransitionView()
}

