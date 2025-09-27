//
//  ContentView.swift
//  Navigation Example
//
//  Created by 이승준 on 9/24/25.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    @State var age: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                
                VStack(alignment: .leading) {
                    Text("Enter your name")
                    TextField("What's your name?", text: $name)
                }
                
                VStack(alignment: .leading) {
                    Text("Enter your age")
                    TextField("18", text: $age)
                        .keyboardType(.numberPad)
                }
                
                Spacer()
                
                NavigationLink(
                    destination: {
                        ZStack{
                            Color.orange.ignoresSafeArea()
                            Text("New View")
                        }
                    },
                    label: {Text("Go to Orange View")
                            .font(.title)
                            .padding()
                            .overlay(Capsule().stroke())}
                )
                
                NavigationLink(
                    destination: {
                        DrinkingView(
                            name: name,
                            age: age,
                            drinkingAge: 18
                        )
                    },
                    label: {Text("Okay")
                            .font(.title)
                            .padding()
                            .overlay(Capsule().stroke())}
                )
            }
            .padding()
            .navigationTitle("Example")
        }
    }
}

struct DrinkingView: View {
    let name: String
    let age: String
    let drinkingAge: Int
    
    var numericalAge: Int {
        Int(age) ?? -1
    }
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.2).ignoresSafeArea()
            
            if numericalAge > drinkingAge {
                Text("\(name.capitalized), you can drink.")
            } else if numericalAge < 0{
                Text("\"\(age)\" is not valid.")
            } else {
                VStack {
                    Text("Sorry \(name.capitalized)")
                    Text("Can't serve you.")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
