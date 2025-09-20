//
//  TextView.swift
//  Greetings
//
//  Created by 이승준 on 9/20/25.
//

import SwiftUI

struct TextView: View {
    let text: LocalizedStringKey
    @State var color: Color
    
    let colors: [Color] = [
        .red,
        .green,
        .blue,
        .orange,
        .yellow,
        .purple,
        Color(red: 0.5, green: 0, blue: 0.5),
        Color(red: 0, green: 0.5, blue: 0.5),
        Color(red: 139/255, green: 207/255, blue: 240/255),
        Color(red: 1, green: 215/255, blue: 0)
    ]
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass) var verticalSizeClass

    var isIPad: Bool {
        horizontalSizeClass == .regular && verticalSizeClass == .regular
    }
    
    var font: Font {
        #if os(macOS)
        .title
        #elseif os(iOS)
        isIPad ? .largeTitle : .body
        #endif
    }
    
    var body: some View {
        Text(text)
            .font(font)
            .fontWeight(.semibold)
            .padding()
            .foregroundStyle(Color.white)
            .background(color.opacity(0.4))
            .cornerRadius(20)
            .shadow(color: color, radius: 5, x: 10, y: 10)
            .onTapGesture{
                color = colors.randomElement()!
            }
    }
}

#Preview {
    VStack{
        TextView(text: "Hello there", color: .blue)
        TextView(text: "Hummus", color: .green)
        TextView(text: "Hello there!", color: .yellow)
    }
}
