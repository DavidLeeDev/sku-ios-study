//
//  ContentView.swift
//  Greetings
//
//  Created by 이승준 on 9/20/25.
//

import SwiftUI

struct GreetingsView: View {
    
    var body: some View {
        ZStack {
            BackgroundView()
            VStack(alignment: .leading) {
                //            Text("Hello there!")
                //                .fontWeight(.semibold)
                //                .padding()
                //                .foregroundStyle(Color.white)
                //                .background(Color.green.opacity(0.4))
                //                .cornerRadius(20)
                //                .shadow(color: Color.green, radius: 5, x: 10, y: 10)
                //            
                //            Text("Welcome to Swift Programming!")
                //                .fontWeight(.semibold)
                //                .padding()
                //                .foregroundStyle(Color.white)
                //                .background(Color.gray.opacity(0.4))
                //                .cornerRadius(20)
                //                .shadow(color: Color.gray, radius: 5, x: 10, y: 10)
                //            
                //            Text("Are you ready to, ")
                //                .fontWeight(.semibold)
                //                .padding()
                //                .foregroundStyle(Color.white)
                //                .background(Color.yellow.opacity(0.4))
                //                .cornerRadius(20)
                //                .shadow(color: Color.yellow, radius: 5, x: 10, y: 10)
                //            
                //            Text("start exploring?")
                //                .fontWeight(.semibold)
                //                .padding()
                //                .foregroundStyle(Color.white)
                //                .background(Color.red.opacity(0.4))
                //                .cornerRadius(20)
                //                .shadow(color: Color.red, radius: 5, x: 10, y: 10)
                //            
                //            Text("Boom.")
                //                .fontWeight(.semibold)
                //                .padding()
                //                .foregroundStyle(Color.white)
                //                .background(Color.purple.opacity(0.4))
                //                .cornerRadius(20)
                //                .shadow(color: Color.purple, radius: 5, x: 10, y: 10)
                //            TextView(text: "Hello there", color: .green)
                //            TextView(text: "Welcome to Swift Programming!", color: .gray)
                //            TextView(text: "Are you ready to, ", color: .yellow)
                //            TextView(text: "start exploring?", color: .red)
                //            TextView(text: "Boom.", color: .purple)
                
                //            TextView(text: messages[0].text, color: messages[0].color)
                //            TextView(text: messages[1].text, color: messages[1].color)
                //            TextView(text: messages[2].text, color: messages[2].color)
                //            TextView(text: messages[3].text, color: messages[3].color)
                //            TextView(text: messages[4].text, color: messages[4].color)
                
                TitleView()
                
                Spacer()
                
                MessagesView()
                
                Spacer()
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    GreetingsView()
}
