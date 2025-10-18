//
//  RotationSectionView.swift
//  Gestures Exploration
//
//  Created by 이승준 on 10/17/25.
//

import SwiftUI

struct RotationSectionView: View {
    @State private var rotation: Double = 0.0
    var body: some View {
        Section(content: {
            NavigationLink(#"Rotation Gesture "Bounce Back""#, destination: {
                RotationGestureBounceBack()
            })
            NavigationLink(#"Rotation Gesture "Stay Still""#, destination: {
                RotateGestureView()
            })
            NavigationLink(destination: {
                RotateGestureStoreState(rotation: $rotation)
            }, label: {
                VStack(alignment: .leading){
                    Text("Rotation Gesture")
                    Text("Store state")
                        .fontWeight(.thin)
                }
            })
        }, header: {
            Text("Rotation Gesture Demo")
        })
    }
}


#Preview {
    RotationSectionView()
}
