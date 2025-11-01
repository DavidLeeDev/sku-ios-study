//
//  ContentView.swift
//  Explore Custom Label
//
//  Created by 이승준 on 11/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
            Label("Custom Label", systemImage: "globe")
            CustomLabel(text: "Custome Label", systemName: "globe")
            
            Label("Generic Label", systemImage: "globe")
                .labelStyle(
                    NewLabelStyle(
                        color1: .green.opacity(0.3),
                        color2: .cyan.opacity(0.7),
                        cornerRadius: 15
                    )
                )
        }
        .padding()
    }
}

struct CustomLabel: View {
    let text: String
    let systemName: String
    var body: some View{
        HStack{
            Text(text)
            Image(systemName: systemName)
        }
    }
}

struct NewLabelStyle: LabelStyle {
    let color1: Color
    let color2: Color
    let cornerRadius: CGFloat
    func makeBody(configuration: Configuration) -> some View {
        HStack{
            configuration.title
            configuration.icon
        }
        .foregroundStyle(.white)
        .padding()
        .background(LinearGradient(colors: [color1, color2], startPoint: .topLeading, endPoint: .bottomTrailing))
        .cornerRadius(cornerRadius)
    }
}

#Preview {
    ContentView()
}
