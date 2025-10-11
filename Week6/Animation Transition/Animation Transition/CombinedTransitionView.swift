//
//  CombinedTransitionView.swift
//  Animation Transition
//
//  Created by 이승준 on 10/11/25.
//


import SwiftUI

struct CombinedTransitionView: View {
    @State private var show = true
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                Spacer()
                
                if show{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.pink.gradient)
                        .frame(width: 200, height: 200)
                        .transition(
                            .move(edge: .bottom)
                            .combined(with: .opacity)
                        )
                }
                
                Spacer()
                
                Button(show ? "Hide" : "Show") {
                    withAnimation{
                        show.toggle()
                    }
                }.buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    CombinedTransitionView()
}
