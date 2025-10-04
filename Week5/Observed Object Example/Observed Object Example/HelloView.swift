//
//  ContentView.swift
//  Observed Object Example
//
//  Created by 이승준 on 10/3/25.
//

import SwiftUI
internal import Combine

class SomeViewModel: ObservableObject {
    @Published var data1: String = "Hello World!"
    @Published var data2: String = "We love programming"
}

struct HelloView: View {
    @StateObject var viewModel = SomeViewModel()
    var body: some View {
        VStack {
            Text(viewModel.data1)
            Text(viewModel.data2)
            
            Button(action: {
                if viewModel.data1 == "Hello World!"{
                    viewModel.data1 = "Change"
                    viewModel.data2 = "Try Again"

                } else {
                    viewModel.data1 = "Hello World!"
                    viewModel.data2 = "We love programming"

                }
                
            }, label: {
                Text("Click Me")
            })
        }
        .padding()
    }
}

struct RandomNumberView: View {
    @State private var randomNumber = 0
    var body: some View {
        VStack{
            Text("Random number is \(randomNumber)")
            Button("Randomize number", action: {
                randomNumber = (0..<1000).randomElement() ?? 0
            })
            
            HelloView()
        }
        .font(.title)
    }
    
}

#Preview {
    RandomNumberView()
}
