//
//  ContentView.swift
//  LeftCenterRightDemo
//
//  Created by 이승준 on 11/8/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("LEFT")
                .left()
            Text("CENTER")
                .frame(maxWidth: .infinity, alignment: .center)
            Text("RIGHT")
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .font(.largeTitle)
        .padding()
    }
}

#Preview {
    ContentView()
}
