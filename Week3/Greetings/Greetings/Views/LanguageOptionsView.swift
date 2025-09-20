//
//  LanguageOptionsView.swift
//  Greetings
//
//  Created by 이승준 on 9/20/25.
//

import SwiftUI

struct LanguageOptionsView: View {
    @Binding var language: String
    @Binding var layoutDirectionString: String
    var body: some View {
        Image(systemName: "gearshape.fill")
            .contextMenu {
                Button("English") {
                    language = "en"
                    layoutDirectionString = LEFT_TO_RIGHT
                }
                Button("Korean") {
                    language = "ko"
                    layoutDirectionString = RIGHT_TO_LEFT
                }
            }
    }
}

#Preview {
    LanguageOptionsView(language: .constant("en"), layoutDirectionString: .constant(LEFT_TO_RIGHT))
}
