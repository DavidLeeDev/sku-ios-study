//
//  UsingAlignmentModifier.swift
//  Fun With Frames
//
//  Created by 이승준 on 9/27/25.
//

import SwiftUI

struct UsingAlignmentModifier: View {
    var body: some View {
        ZStack {
            Text("Upper Left").align(alignment: .topLeading)
            Text("Upper Right").align(alignment: .topTrailing)
            Text("Bottom Left").align(alignment: .bottomTrailing)
            Text("Bottom Right").align(alignment: .bottomLeading)
            
            Text("Center Left").align(alignment: .leading)
            Text("Center Right").align(alignment: .trailing)
            Text("Center").align(alignment: .center)
            Text("Center top").align(alignment: .top)
            Text("Center bottom").align(alignment: .bottom)

        }
        .fontWeight(.semibold)
        .font(.headline)
        .foregroundStyle(.tint)
        .padding()
    }
}

#Preview {
    UsingAlignmentModifier()
}
