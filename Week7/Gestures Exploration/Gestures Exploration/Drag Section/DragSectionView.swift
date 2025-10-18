//
//  DragSectionView.swift
//  Gestures Exploration
//
//  Created by 이승준 on 10/17/25.
//

import SwiftUI

struct DragSectionView: View {
    @State private var scaleFactor: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    var body: some View {
        Section(content: {
            NavigationLink("Drag Gesture\"Go Back\"", destination: {
                // TODO: Drag gesture go back
                DragGestureBounceBack()
            })
            NavigationLink(#"Drag Gesture "Stay Still""#, destination: {
                DragGestureDemo()
            })
            NavigationLink(destination: {
                DragGestureStoreState(endOffset: $offset)
            }, label: {
                VStack(alignment: .leading){
                    Text("Drag Gesture")
                    Text("Store state")
                        .fontWeight(.thin)
                }
            })
        }, header: {
            Text("Drag Gesture Demo")
        })
    }
}

#Preview {
    DragSectionView()
}
