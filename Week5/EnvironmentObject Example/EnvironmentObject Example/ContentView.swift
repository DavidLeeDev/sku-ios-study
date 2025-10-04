//
//  ContentView.swift
//  EnvironmentObject Example
//
//  Created by 이승준 on 10/3/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("ContentView: \(userViewModel.name)")
                    .font(.title)
                
                NavigationLink("Update Data", destination: UserDataView())
                
            }
            .navigationTitle("Parent View")
            .padding()
        }
    }
}

struct UserDataView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        VStack{
            Text("Name: \(userViewModel.name)")
            TextField("Enter Name", text: $userViewModel.name)
                .padding()
                .background(Color.blue.opacity(0.3))
                .padding()
        }
        .navigationTitle("Enter Name View")
    }
}

#Preview {
    ContentView()
        .environmentObject(UserViewModel())
}
