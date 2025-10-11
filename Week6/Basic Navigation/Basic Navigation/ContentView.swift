//
//  ContentView.swift
//  Basic Navigation
//
//  Created by 이승준 on 10/11/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome!").font(.title)
                
                List{
                    NavigationLink("Go to Details"){
                        DetailView()
                    }
                    
                    NavigationLink("Go to View 7"){
                        Text("I like the number 7")
                    }
                }
            }
            .navigationTitle("Home Screen")
        }
    }
}

struct DetailView: View {
    var body: some View {
        Text("This is detail view!")
            .font(.title)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 20))
    }
}

#Preview {
    ContentView()
}
