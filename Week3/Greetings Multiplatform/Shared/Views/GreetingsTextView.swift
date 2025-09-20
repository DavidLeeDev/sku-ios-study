//
//  GreetingsTextView.swift
//  Greetings
//
//  Created by 이승준 on 9/20/25.
//

import SwiftUI

struct GreetingsTextView: View {
    @Binding var subtitle: LocalizedStringKey
    let subtitles: [LocalizedStringKey] = [
        "Explorting iOS Programming",
        "Learning how to bake",
        "Programming recipes",
        "A quest for knowledge",
    ]
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("Greetings")
                .font(.largeTitle)
                .fontWeight(.semibold)
            #if os(macOS)
            Text(subtitle)
                .font(.largeTitle)
                .bold()
            #elseif os(iOS)
            Text(subtitle)
                .font(.headline)
                .fontWeight(.thin)
            #endif
            #if os(macOS)
            Text("MAC APP")
            #elseif os(iOS)
            Text("iOS APP")
            #endif
        }
        .onTapGesture {
            subtitle = subtitles.randomElement() ?? LocalizedStringKey("Exploring ios programming")
        }
    }
}

#Preview {
    GreetingsTextView(subtitle: .constant("Exploring iOS Programming"))
}
