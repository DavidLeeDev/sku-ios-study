//
//  SlideTransitionView.swift
//  Animation Transition
//
//  Created by 이승준 on 10/11/25.
//

import SwiftUI

struct SlideTransitionView: View {
    @State private var show = false
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                Spacer()
                
                if show{
                    Circle()
                        .fill(.pink.gradient)
                        .frame(width: 200, height: 200)
                        .transition(.slide)
                }
                
                Spacer()
                
                Button(show ? "Hide" : "Show") {
                    withAnimation{
                        show.toggle()
                    }
                }.buttonStyle(.borderedProminent)
            }
        }.navigationTitle("Slide Transition")
    }
}

#Preview {
    SlideTransitionView()
}
