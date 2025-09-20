//
//  LandscapeGreetingsView.swift
//  Greetings
//
//  Created by 이승준 on 9/20/25.
//

import SwiftUI

struct LandscapeGreetingsView: View {
    var body: some View {
        ZStack {
            BackgroundView()
            HStack {
                VerticalTitleView()
                
                Spacer()
                
                MessagesView()
                
            }
            .padding()
        }

    }
}

#Preview {
    LandscapeGreetingsView()
}
