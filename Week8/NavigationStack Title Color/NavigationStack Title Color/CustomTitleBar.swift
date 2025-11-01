//
//  CustomTIitleBar.swift
//  NavigationStack Title Color
//
//  Created by 이승준 on 11/1/25.
//

import SwiftUI

//  NavigationStack Title Color
//
//  Created by 이승준 on 11/1/25.
//

import SwiftUI

struct CustomTitleBar: View {
    init() {
        UINavigationBar
            .appearance()
            .largeTitleTextAttributes = [
                .foregroundColor: UIColor.red
            ]
    }
    var body: some View {
        NavigationStack {
            NavigationLink(destination: {
                ZStack{
                    Color.gray.opacity(0.3)
                        .ignoresSafeArea()
                    Text("New View")
                }
            }, label: {
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text("Hello, world!")
                }
            })
            .navigationTitle("My Title")
        }
    }
}
#Preview {
    CustomTitleBar()
}
