//
//  MoveTransitionView.swift
//  Animation Transition
//
//  Created by 이승준 on 10/11/25.
//

import SwiftUI

struct MoveTransitionView: View {
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
                        .transition(.move(edge: .bottom))
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
    MoveTransitionView()
}
