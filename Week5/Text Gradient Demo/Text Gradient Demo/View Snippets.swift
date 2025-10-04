//
//  View Snippets.swift
//  Text Gradient Demo
//
//  Created by 이승준 on 10/4/25.
//

import SwiftUI

struct View_Snippets: View {
    
    var body: some View {
        NiceView3()
    }
}

struct NiceView1: View {
    var body: some View {
        ZStack {
            Color.blue.opacity(0.7).ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Hello View")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.1)
                
                Text("Welcome to a new view")
                    .font(.headline)
                    .fontWeight(.thin)
                
                Spacer()
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding()
        }
    }
}

struct NiceView2: View {
    @State var textOpacity: CGFloat = 0.0
    var body: some View {
        ZStack {
            Color.red.opacity(0.7).ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Hello View")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.1)
                    .opacity(textOpacity)
                
                Text("Welcome to a new view")
                    .font(.headline)
                    .fontWeight(.thin)
                    .opacity(textOpacity)
                
                Spacer()
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .onAppear{
                    withAnimation(Animation.easeOut(duration: 3)){
                        textOpacity = 1.0
                    }
                }
        }
    }
}

struct NiceView3: View {
    @State var textOpacity: CGFloat = 0.0
    @State private var textStartOffsetX: CGFloat = 0.0
    @State private var textStartOffsetY: CGFloat = 100
    var body: some View {
        ZStack {
            Color.green.opacity(0.7).ignoresSafeArea()
            
            VStack(alignment: .leading, spacing: 0) {
                Text("Hello View")
                    .font(.title)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.1)
                    .opacity(textOpacity)
                    .offset(
                        x: textStartOffsetX
                        , y: textStartOffsetY
                    )
                
                Text("Welcome to a new view")
                    .font(.headline)
                    .fontWeight(.thin)
                    .opacity(textOpacity)
                    .offset(
                        x: textStartOffsetX
                        , y: textStartOffsetY
                    )
                
                Spacer()
            }.frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .onAppear{
                    withAnimation(Animation.easeOut(duration: 1)){
                        textOpacity = 1.0
                        textStartOffsetX = 0
                        textStartOffsetY = 0
                    }
                }
        }
    }
}

#Preview {
    View_Snippets()
}
