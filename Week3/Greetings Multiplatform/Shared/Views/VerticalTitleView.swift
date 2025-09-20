//
//  VerticalTitleView.swift
//  Greetings
//
//  Created by 이승준 on 9/20/25.
//

import SwiftUI

struct VerticalTitleView: View {
    @State private var subtitle: LocalizedStringKey = "Exploring iOS Programming"
    var body: some View {
        VStack(alignment: .leading) {
            GreetingsTextView(subtitle: $subtitle)
            RotatableCircleView()
            Spacer()
        }.padding(.vertical)
    }
}

#Preview {
    VerticalTitleView()
}
