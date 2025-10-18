//
//  MagnificationSectionView.swift
//  Gestures Exploration
//
//  Created by 이승준 on 10/17/25.
//

import SwiftUI

struct MagnificationSectionView: View {
    @State private var scaleFactor: CGFloat = 1.0
    var body: some View {
        Section(content: {
            NavigationLink("Maginification Gesture\"Go Back\"", destination: {
                MagnificationBounceBackView()
            })
            NavigationLink(#"Maginification Gesture "Stay Still""#, destination: {
                MagnificationStayStillView()
            })
            NavigationLink(destination: {
                MagnificationStoreStateView(scaleFactor: $scaleFactor)
            }, label: {
                VStack(alignment: .leading){
                    Text("Maginification Gesture")
                    Text("Store state")
                        .fontWeight(.thin)
                }
            })
        }, header: {
            Text("Manification Gesture Demo")
        })
    }
}

#Preview {
    Form {
        MagnificationSectionView()
    }
}
