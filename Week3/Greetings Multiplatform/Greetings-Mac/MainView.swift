//
//  MainView.swift
//  Greetings
//
//  Created by 이승준 on 9/20/25.
//

import SwiftUI
// Portrait = Compact width, regular height
// ipad = Regular width, regular height
struct MainView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass

    @Binding var language: String
    @Binding var layoutDirectionString: String
    var body: some View {
        NavigationStack {
            GreetingsView()
                .toolbar {
                    ToolbarItem(placement: .navigation) {
                        LanguageOptionsTapView(language: $language, layoutDirectionString: $layoutDirectionString)
                    }
                }
        }
    }
}

#Preview {
    MainView(language: .constant("en"), layoutDirectionString: .constant(LEFT_TO_RIGHT))
}
