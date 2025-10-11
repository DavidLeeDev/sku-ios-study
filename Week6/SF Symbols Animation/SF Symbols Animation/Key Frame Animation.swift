//
//  Key Frame Animation.swift
//  SF Symbols Animation
//
//  Created by 이승준 on 10/10/25.
//

import SwiftUI

struct AnimationValues {
    var offsetY: CGFloat = -300
    var rotation: Angle = Angle(degrees: 0)
    var scaleX = 1.0
}


struct Key_Frame_Animation: View {
    let timeDuration: Double
    var body: some View {
        MyShape()
            .keyframeAnimator(initialValue: AnimationValues()){
                view, value in
                view
                    .rotationEffect(value.rotation)
                    .offset(y: value.offsetY)
                    .scaleEffect(x: value.scaleX)
            } keyframes: {_ in
                KeyframeTrack(\.offsetY){
                    LinearKeyframe(-300, duration: 0.2*timeDuration)
                    SpringKeyframe(0, duration: 0.2*timeDuration)
                    LinearKeyframe(-100, duration: 0.3*timeDuration)
                }
                KeyframeTrack(\.rotation){
                    CubicKeyframe(.zero, duration: 0.5 * timeDuration)
                    CubicKeyframe(Angle(degrees: 20*360), duration: 0.5 * timeDuration)
                }
                KeyframeTrack(\.scaleX){
                    SpringKeyframe(1, duration: 0.25*timeDuration)
                    SpringKeyframe(0.1, duration: 0.5*timeDuration)
                    SpringKeyframe(0.8, duration: 0.25*timeDuration)
                }
            }
    }
}

struct MyShape: View {
    var body: some View {
        Circle()
            .stroke(AngularGradient(colors: [
                .red, .green, .blue, .yellow, .black, .indigo, .pink
            ], center: .center), lineWidth: 20)
            .shadow(radius: 3)
            .frame(width: 100, height: 100)
    }
}

#Preview {
    Key_Frame_Animation(timeDuration: 4)
}
