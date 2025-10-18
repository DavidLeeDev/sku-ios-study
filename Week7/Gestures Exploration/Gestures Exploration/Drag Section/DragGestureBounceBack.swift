//
//  DragGestureBounceGack.swift
//  Gestures Exploration
//
//  Created by 이승준 on 10/17/25.
//

import SwiftUI

struct DragGestureBounceBack: View {
    @State private var offset: CGSize = .zero
    
    var body: some View {
        NavigationStack {
            VStack {
                Squares()
                
                Spacer()
                
                NiceTextView(
                    text: "Hello, World!",
                    bgColor: .black.opacity(0.85),
                    fgColor: .orange.opacity(0.85),
                    radius: 10
                )
                .offset(offset)
                .gesture(
                    DragGesture()
                        .onChanged{
                            value in
                            offset = value.translation
                        }
                        .onEnded{
                            _ in
                            withAnimation(.spring){
                                offset = .zero
                            }
                        }
                )
                Spacer()
            }
            .navigationTitle("Drag and Bounce Back")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DragGestureBounceBack()
}
