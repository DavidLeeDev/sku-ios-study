//
//  ContentView.swift
//  Scroll Transition Visual Effects
//
//  Created by 이승준 on 9/27/25.
//

import SwiftUI

struct ScrollTransitionExample1: View {
    
    var body: some View {
        ScrollView(.horizontal){
            HStack(spacing: 10) {
                ForEach(images, id: \.self) { name in
                    ZStack{
                        MyImageView(name: name)
                            .scrollTransition(axis: .horizontal){
                                content, phase in
                                
                                //-1...1
                                let value = phase.value
                                
                                let opacity = cos(.pi/2*value)
                                
                                return content
                                    //.scaleEffect(opacity)
                                    .opacity(opacity)
                                    .offset(y: phase.value * 200)
                            }
                    }
                    .containerRelativeFrame(.horizontal)
                }
            }
        }
    }
}

#Preview {
    ScrollTransitionExample1()
}
