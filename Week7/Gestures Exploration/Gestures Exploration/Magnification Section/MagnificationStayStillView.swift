//
//  MagnificationView.swift
//  Gestures Exploration
//
//  Created by 이승준 on 10/17/25.
//

import SwiftUI

struct MagnificationStayStillView: View {
    @State private var scaleFactor: CGFloat = 1.0
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
            .navigationTitle("Magnify and Stay Still")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MagnificationStayStillView()
}
