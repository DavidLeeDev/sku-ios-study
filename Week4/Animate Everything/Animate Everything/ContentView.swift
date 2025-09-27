//
//  ContentView.swift
//  Animate Everything
//
//  Created by 이승준 on 9/24/25.
//

import SwiftUI

struct AnimatedTextView: View {
    var offset: CGSize {
        CGSize(width: 0, height: togglePosition ? 400 : 0)
    }
    @State private var togglePosition = false
    var color: Color {
        togglePosition ? .red : .blue
    }
    var font: Font {
        togglePosition ? .headline : .title
    }
    var rotate: CGFloat {
        togglePosition ? 0 : 360
    }
    var bgColor: Color {
        togglePosition ? .black.opacity(0.85) : .gray.opacity(0.3)
    }
    var text: String {
        togglePosition ? "Hello World!" : "안녕하세요"
    }
    var body: some View {
        ZStack {
            bgColor
                .ignoresSafeArea()
            VStack {
                Text(text)
                    .font(font)
                    .fontWeight(.semibold)
                    .foregroundStyle(color)
                    .rotationEffect(Angle(degrees: rotate))
                    .offset(offset)
                
                Spacer()
                
                Button {
                    //                withAnimation(.bouncy(duration: 3)){
                    //                withAnimation(.easeInOut(duration: 3)){
                    withAnimation(.spring(response: 0.55, dampingFraction: 0.825, blendDuration: 0)){
                        togglePosition.toggle()
                    }
                } label: {
                    Text("Animate")
                        .font(.title)
                        .fontWeight(.semibold)
                }.buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}

#Preview {
    AnimatedTextView()
}
