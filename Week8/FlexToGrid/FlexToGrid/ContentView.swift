//
//  ContentView.swift
//  FlexToGrid
//
//  Created by 이승준 on 11/1/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.cyan.opacity(0.3).ignoresSafeArea()
            Grid(verticalSpacing: 0){
                GridRow{
                    RectangleTextView(color: .blue, text: "50 %")
                }
                GridRow{
                    Grid(verticalSpacing: 0){
                        GridRow{
                            RectangleTextView(color: .red, text: "25 %")
                        }
                        GridRow{
                            RectangleTextView(color: .green, text: "25 %")
                        }
                    }
                }
            }
        }
        
    }
}

struct RectangleTextView: View{
    let color: Color
    let text: String
    var body: some View{
        ZStack{
            Rectangle()
                .fill(color)
            Text(text)
                .font(.title)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    ContentView()
}
