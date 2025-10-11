//
//  AsymmetricTransitionView.swift
//  Animation Transition
//
//  Created by 이승준 on 10/11/25.
//


import SwiftUI
struct AsymmetricTransitionView: View {
    @State private var show = false
    var body: some View {
        ZStack{
            BackgroundView()
            
            VStack{
                Spacer()
                
                if show{
                    RoundedRectangle(cornerRadius: 25)
                        .fill(.orange.gradient)
                        .frame(width: 200, height: 200)
                        .transition(
                            .asymmetric(
                                insertion: .move(edge: .leading),
//                                removal: .move(edge: .bottom)
                                removal: .opacity

                            )
                        )
                }
                
                Spacer()
                
                Button(show ? "Hide" : "Show") {
                    withAnimation{
                        show.toggle()
                    }
                }.buttonStyle(.borderedProminent)
            }
        }.navigationTitle("AsymmetricTransitionView")
    }
}

#Preview {
    AsymmetricTransitionView()
}
