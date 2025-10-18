//
//  ContentView.swift
//  Gestures Exploration
//
//  Created by 이승준 on 10/17/25.
//

import SwiftUI

struct GesturesDemo: View {
    var body: some View {
        NavigationStack {
            Form {
                MagnificationSectionView()
                DragSectionView()
                RotationSectionView()
                GeneralGestureSectionView()
            }
            .navigationTitle("Gesture")
        }
    }
}

#Preview {
    GesturesDemo()
}
