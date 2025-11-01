//
//  ContentView.swift
//  ChocolateView
//
//  Created by 이승준 on 11/1/25.
//

import SwiftUI

struct ContentView: View {
    let text: String = "Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate Chocolate"
    
    let n = 300
    @State var angle = 0.0
    let spacing = 20.0
    @State var opacity = 0.5
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .opacity(0.7)
            VStack(spacing: 20){
                ForEach(0..<n, id: \.self){ item in
                    Text(text)
                        .fixedSize(horizontal: true, vertical: false)
                        .font(.caption)
                }
            }
            .rotationEffect(Angle(degrees: angle))
            .opacity(opacity)
        }
        .onAppear {
            withAnimation(.linear(duration: 2))(
                angle = -50.0,
                opacity = 0.7
            )
        }
    }
}

#Preview {
    ContentView()
}
