//
//  SunMoonView.swift
//  Calculator
//
//  Created by 이승준 on 11/8/25.
//

import SwiftUI

struct SunMoonView: View {
    var lightMode: Bool
    var body: some View {
        HStack(spacing: 30){
            Image(systemName: "sun.min")
                .imageScale(.large)
                .foregroundStyle(
                    lightMode ? sunOrMoonSelectedColor : sunOrMoonNotSelectedColor
                )
            Image(systemName: "moon")
                .imageScale(.large)
                .foregroundStyle(
                    lightMode ? sunOrMoonNotSelectedColor : sunOrMoonSelectedColor
                )
        }.padding()
            .background(secondaryBackgroundColor)
            .cornerRadius(20)
    }
}

#Preview {
    VStack{
        SunMoonView(lightMode: true)
        SunMoonView(lightMode: false)
    }
}
