//
//  ContentView.swift
//  Arithmetic Progression
//
//  Created by 이승준 on 9/26/25.
//

import SwiftUI

//Exercise 3:
//Display a, a+d, a+2d, ..., a+(n-1)*d
//in a VStack


struct ContentView: View {
    let a: Int
    let d: Int
    let n: Int
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 20) {
                ForEach(0 ..< n, id: \.self){i in
                    Text("\(a+i*d)")
                }
                .font(.largeTitle)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView(a: 5, d: 5, n: 100)
}
