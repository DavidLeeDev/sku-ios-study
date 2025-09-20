//
//  TitleView.swift
//  Greetings
//
//  Created by 이승준 on 9/20/25.
//

import SwiftUI
import TipKit

struct TitleView: View {
    @State private var subtitle: LocalizedStringKey = "Exploring iOS Programming"
    private var greetingsTip = GreetingsTip()
    var body: some View {
        HStack {
            GreetingsTextView(subtitle: $subtitle)
                .popoverTip(greetingsTip)
            Spacer()
            RotatableCircleView()
        }
    }
}

#Preview {
    VStack{
        TitleView()
        Spacer()
    }
    .padding()
}
