//
//  MagnificationStoreStateView.swift
//  Gestures Exploration
//
//  Created by 이승준 on 10/17/25.
//

import SwiftUI

struct MagnificationStoreStateView: View {
    @Binding var scaleFactor: CGFloat
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                NiceTextView(
                    text: "Hello World!",
                    bgColor: .black,
                    fgColor: .orange,
                    radius: 10
                )
                .scaleEffect(scaleFactor)
                .gesture(
                    MagnificationGesture()
                        .onChanged {value in
                            withAnimation(.spring()){
                                scaleFactor = value
                            }
                        }
                        .onEnded {value in
                            withAnimation(.spring()){
                                scaleFactor = 1.0
                            }
                        }
                )
                Spacer()
            }
            .navigationTitle("Magnify and Store State")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MagnificationStoreStateView(scaleFactor: .constant(1.0))
}
