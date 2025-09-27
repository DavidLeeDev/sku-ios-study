//
//  ContentView.swift
//  Fun With Frames
//
//  Created by 이승준 on 9/27/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Text("Upper Left").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
            Text("Upper Right").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            Text("Bottom Left").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
            Text("Bottom Right").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
            
            Text("Center Left").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            Text("Center Right").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .trailing)
            Text("Center").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            Text("Center top").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
            Text("Center bottom").frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)

        }
        .fontWeight(.semibold)
        .font(.headline)
        .foregroundStyle(.tint)
        .padding()
    }
}

#Preview {
    ContentView()
}
