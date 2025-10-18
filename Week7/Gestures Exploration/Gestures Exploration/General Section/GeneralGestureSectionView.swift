//
//  GeneralGestureSectionView.swift
//  Gestures Exploration
//
//  Created by 이승준 on 10/17/25.
//

import SwiftUI

struct GeneralGestureSectionView: View {
    @State private var scaleFactor: CGFloat = 1.0
    @State private var offset: CGSize = .zero
    var body: some View {
        Section(content: {
            NavigationLink("General Gesture", destination: {
                // TODO: Drag gesture go back
                DragGestureBounceBack()
            })
        }, header: {
            Text("General Gesture Demo")
        })
    }
}





#Preview {
    GeneralGestureSectionView()
}
