//
//  MessageView.swift
//  ToolTipView
//
//  Created by 이승준 on 11/1/25.
//

import SwiftUI

struct MessageView: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding()
            .background(Color.cyan.cornerRadius(5))
    }
}

#Preview {
    MessageView(text: "Image of lightening")
}
