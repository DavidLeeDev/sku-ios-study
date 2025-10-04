//
//  ContentView.swift
//  ImageExercise
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct ContentView: View {
    @State var isStart: Bool = true
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.white, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            Image("imgLightening1")
                .resizable()
                .frame(width: 300, height: 300)
                .clipShape(Circle())
                .overlay(
                    Button(action: {
                        isStart.toggle()
                    }, label: {
                        if isStart {
                            Text("End")
                        } else {
                            Text("Start ")
                        }
                    })
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                    .background(.blue)
                    .foregroundStyle(.green)
                    .cornerRadius(45)
                )
        }
    }
}

#Preview {
    ContentView()
}
