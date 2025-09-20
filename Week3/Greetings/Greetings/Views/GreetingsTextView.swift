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
            Text(subtitle)
                .font(.headline)
                .fontWeight(.thin)
        }
        .onTapGesture {
            subtitle = subtitles.randomElement() ?? LocalizedStringKey("Exploring ios programming")
        }
    }
}

#Preview {
    GreetingsTextView(subtitle: .constant("Exploring iOS Programming"))
}
