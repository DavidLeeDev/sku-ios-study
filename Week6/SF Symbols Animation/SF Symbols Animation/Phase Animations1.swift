//
//  Phase Animations1.swift
//  SF Symbols Animation
//
//  Created by 이승준 on 10/10/25.
//

import SwiftUI

struct AnimateProperties: Equatable {
    let color: Color
    let bgColor: Color
    let font: Font
    let fontWeight: Font.Weight
    let cornerRadius: CGFloat
    let xScale: CGFloat
    let yScale: CGFloat
    let offsetY: CGFloat
    let rotation: CGFloat
}

struct Phase_Animations1: View {
    @State private var animateMe = false
    
    let phases: [AnimateProperties] = [
        .init(
            color: .red,
            bgColor: .black,
            font: .title,
            fontWeight: .semibold,
            cornerRadius: 20,
            xScale: 1,
            yScale: 1,
            offsetY: 0,
            rotation: 0
        ),
        .init(
            color: .blue,
            bgColor: .gray,
            font: .body,
            fontWeight: .thin,
            cornerRadius: 0,
            xScale: 1.5,
            yScale: 1,
            offsetY: 50,
            rotation: 60
        ),
        .init(
            color: .blue,
            bgColor: .gray,
            font: .body,
            fontWeight: .thin,
            cornerRadius: 100,
            xScale: 1.5,
            yScale: 1,
            offsetY: 10,
            rotation: 60
        ),
        .init(
            color: .purple,
            bgColor: .black,
            font: .largeTitle,
            fontWeight: .bold,
            cornerRadius: 50,
            xScale: 1,
            yScale: 1,
            offsetY: -20,
            rotation: 0
        )
    ]
    var body: some View {
        VStack{
            Spacer()
            
            Text("Hello, World!")
                .phaseAnimator(phases, trigger: animateMe){
                    view, phase in
                    view
                        .foregroundStyle(phase.color)
                        .font(phase.font)
                        .fontWeight(phase.fontWeight)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: phase.cornerRadius)
                                .fill(phase.bgColor.gradient)
                        )
                        .scaleEffect(x: phase.xScale, y: phase.yScale)
                        .offset(y: phase.offsetY)
                        .rotation3DEffect(
                            Angle(degrees: phase.rotation),
                            axis: (x: 1.0, y: 0.0, z: 0.0)
                        )
                }
                
            Text("Hello, World!")
                .foregroundStyle(.blue)
                .font(.body)
                .fontWeight(.thin)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 0)
                        .fill(.green.gradient)
                )
                .scaleEffect(x: 1.5, y: 1)
                .offset(y: 50)
                .rotation3DEffect(
                    Angle(degrees: 60),
                    axis: (x: 1.0, y: 0.0, z: 0.0)
                )
            Spacer()
            
            Button(action: {
                animateMe.toggle()
            }, label: {
                Text(animateMe ? "Stop" : "Play")
            })
        }
    }
}

#Preview {
    Phase_Animations1()
}
