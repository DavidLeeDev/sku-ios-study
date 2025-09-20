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
    
    var isPortraitPhone: Bool {
        horizontalSizeClass == .compact && verticalSizeClass == .regular
    }
    var isIPad: Bool {
        horizontalSizeClass == .regular && verticalSizeClass == .regular
    }
    @Binding var language: String
    @Binding var layoutDirectionString: String
    var body: some View {
        //Portrait mode
        if isPortraitPhone || isIPad{
            NavigationStack {
                GreetingsView()
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            LanguageOptionsTapView(language: $language, layoutDirectionString: $layoutDirectionString)
                        }
                    }
            }
        }else {
         //Landscape mode
            NavigationStack{
                LandscapeGreetingsView()
                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            LanguageOptionsTapView(language: $language, layoutDirectionString: $layoutDirectionString)
                        }
                    }
            }
        }
    }
}

#Preview {
    MainView(language: .constant("en"), layoutDirectionString: .constant(LEFT_TO_RIGHT))
}
