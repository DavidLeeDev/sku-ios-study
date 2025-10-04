//
//  ContentView.swift
//  State Example
//
//  Created by 이승준 on 10/3/25.
//

import SwiftUI

struct ContentView: View {
    @State private var bgColor: Color = .green
    var fontTitle: Font = .largeTitle
    var fontsubTitle: Font = .title
    @State private var titleName = "State Example"
    @State private var subtitleName = "Exploring State"
    @State private var RightImageRotation: CGFloat = 0
    @State private var leftImageRotation: CGFloat = 0
    @State private var leftImage = "sun.horizon"
    @State private var rightImage = "moon.zzz.fill"
    
    var body: some View {
        ZStack {
            bgColor.opacity(0.8).ignoresSafeArea()
            VStack {
                VStack(alignment: .leading){
                    Text(titleName)
                        .font(fontTitle)
                        .fontWeight(.semibold)
                    Text(subtitleName)
                        .font(fontsubTitle)
                }
                .onTapGesture {
                    if titleName == "State Example"{
                        titleName = "Hello"
                    }else{
                        titleName = "State Example"
                    }
                    
                    subtitleName = subtitleName == "Happy Coding!" ? "Exploring State" : "Happy Coding!"
                }
    
                Spacer()
                
                HStack{
                    Image(systemName: leftImage)
                        .imageScale(.large)
                        .rotationEffect(Angle(degrees: leftImageRotation))
        
                    Image(systemName: rightImage)
                        .imageScale(.large)
                        .rotationEffect(Angle(degrees: RightImageRotation))
                        
                }
                .foregroundStyle(.black)
                .onTapGesture {
                    withAnimation{
                        leftImageRotation += 90
                        RightImageRotation -= 90.0
                    }
                }
                
                Spacer()
                
                HStack{
                    Button("Background", action: {
                        if bgColor == .green {
                            bgColor = .red
                        } else {
                            bgColor = .green
                        }
                    })
                    
                    Spacer()
                    
                    Button("Change Images", action: {
                        if leftImage == "sun.horizon" {
                            leftImage = "figure"
                        } else {
                            leftImage = "sun.horizon"
                        }
                        if rightImage == "moon.zzz.fill" {
                            rightImage = "figure.dance"
                        }else{
                            rightImage = "moon.zzz.fill"
                        }
                    })
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
