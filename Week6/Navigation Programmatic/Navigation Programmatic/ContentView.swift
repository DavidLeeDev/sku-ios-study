//
//  ContentView.swift
//  Navigation Programmatic
//
//  Created by 이승준 on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var isAnimating = false
    @State private var path = NavigationPath()
    let duration = 3.0
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                Circle()
                    .trim(from: 0, to: isAnimating ? 1 : 0)
                    .stroke(.blue, lineWidth: 7)
                    .frame(width: 100, height: 100)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 1)){
                            isAnimating = true
                        } completion: {
                            path.append("next")
                        }
//                        isAnimating = true
//                        DispatchQueue.main.asyncAfter(deadline: .now() + duration + 0.2){
//                            path.append("next")
//                        }
                    }
            }
            .navigationTitle("Loading...")
            .navigationDestination(for: String.self){ _ in
                NewView()
                    .navigationBarBackButtonHidden()
            }
        }
    }
}

struct NewView: View {
    var body: some View {
        Text("Welcome to the next screen!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
        Text("No coming back!")
            .foregroundStyle(.secondary)
    }
}

#Preview {
    ContentView()
}
