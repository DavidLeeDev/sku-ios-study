//
//  ContentView.swift
//  SwiftUI Basics
//
//  Created by 이승준 on 9/24/25.
//

import SwiftUI

struct ContentView: View {
    let colorList1: [Color] = [.red,.purple,.green,.pink]
    let colorList2: [Color] = [.black,.white,.blue]
    @State private var screenTapped: Bool = false
    let rotationAngle: CGFloat = 360.0
    
    var colors: [Color] {
        return screenTapped ? colorList1 : colorList2
    }
    
    var text: String {
        screenTapped ? "SwiftUI Basics" : "To know what you know and what you do not know, that is true knowledge"
    }
    
    var font: Font {
        screenTapped ? .largeTitle : .title
    }
    
    var body: some View {
        ZStack {
            LinearGradient(
                colors: colors,
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .opacity(0.8)
            .ignoresSafeArea()
            
            VStack{
                Text(text)
                    .font(font)
                    .fontWeight(.semibold)
                    .foregroundStyle(.red)
                    .multilineTextAlignment(.center)
                    .frame(maxHeight: .infinity)
                   // .padding()
//                    .rotation3DEffect(.degrees(screenTapped ? 0 : rotationAngle), axis: (x: 1, y: 1, z: 1))
            
                Text("Another line of text")
                    .font(font)
                    .fontWeight(.semibold)
                    .foregroundStyle(screenTapped ? .blue : .indigo)
                    .multilineTextAlignment(.center)
                    .frame(maxHeight: .infinity)
                    .frame(maxWidth: .infinity)
                    .background(.red)
                   // .padding()
      
            }
            .padding(.horizontal)
            .rotation3DEffect(.degrees(screenTapped ? 0 : rotationAngle), axis: (x: 1, y: 1, z: 1))
        }
        .onTapGesture {
            withAnimation(.easeIn(duration: 0.5)){
                screenTapped.toggle()
            }
        }
    }
}

#Preview {
    ContentView()
}
