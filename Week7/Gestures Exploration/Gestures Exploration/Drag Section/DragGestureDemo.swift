//
//  DragGestureDemo.swift
//  Gestures Exploration
//
//  Created by 이승준 on 10/17/25.
//

import SwiftUI

struct DragGestureDemo: View {
    @State private var currentOffset: CGSize = .zero
    @State private var endOffset: CGSize = .zero
    
    var offset: CGSize {
        CGSize(width: currentOffset.width + endOffset.width, height: currentOffset.height + endOffset.height)
    }
    
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
                            withAnimation(.spring){
                                currentOffset = value.translation
                            }
                        }
                        .onEnded{
                            _ in
                            withAnimation(.spring){
                                endOffset = CGSize(
                                    width: currentOffset.width + endOffset.width,
                                    height: currentOffset.height +
                                    endOffset.height
                                    
                                )
                            }
                        }
                )
                .onTapGesture {
                    withAnimation(.spring()){
                        endOffset = .zero
                        currentOffset = .zero
                    }
                }
                Spacer()
            }
            .navigationTitle("Drag and Stay Still")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    DragGestureDemo()
}
