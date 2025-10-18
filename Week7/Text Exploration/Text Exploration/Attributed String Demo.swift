//
//  Attributed String Demo.swift
//  Text Exploration
//
//  Created by 이승준 on 10/18/25.
//

import SwiftUI

struct Attributed_String_Demo: View {
    var attr1Demo: AttributedString{
        var myString = AttributedString("Attributed String")
        myString.foregroundColor = .orange
        myString.backgroundColor = .black
        myString.font = Font.largeTitle
        myString.kern = 5
        
        return myString
    }
    
    var attr2Demo: AttributedString {
        let codingIsAwesome = "Coding is Awesome! Let's code together"
        var myString = AttributedString()
        
        myString.font = Font.title
        
        for(i, ch) in codingIsAwesome.enumerated(){
            var letterString = AttributedString(String(ch))
            let red = 0.3
            let green = 0.3
            let blue = Double(6*i % codingIsAwesome.count) / Double(codingIsAwesome.count)
            
            letterString.foregroundColor = Color(red: red, green: green, blue: blue)
            letterString.baselineOffset = Double(i)
            myString += letterString
        }
        return myString
    }
    
    var attr3Demo: AttributedString {
        let codingIsAwesome = "Coding is Awesome! Let's code together"
        var myString = AttributedString()
        
        myString.font = Font.title
        
        for (i, ch) in codingIsAwesome.enumerated(){
            var letterString = AttributedString(String(ch))
            
            let count = CGFloat(codingIsAwesome.count)
            let j = CGFloat(codingIsAwesome.count / 2 - i)
            
            letterString.baselineOffset = j*j*5 / count
            
            myString += letterString
        }
        
        return myString
    }
    
    @State private var smileFactor = 5.0
    @State private var flip = 0.0
    
    var body: some View {
        ScrollView {
            Text(attr1Demo)
            Text(attr2Demo)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray.opacity(0.3).clipShape(.rect(cornerRadius: 5)))
            Text(attr3Demo)
                .padding()
                .frame(maxWidth: .infinity)
                .foregroundStyle(.red)
                .rotation3DEffect(Angle(degrees: flip * 180), axis:       (x: 1.0, y: 0.0, z: 0.0))
                .background(Color.black.opacity(0.3).clipShape(.rect(cornerRadius: 5)))
                
            HStack{
                Button("☺️") {
                    withAnimation{
                        smileFactor = abs(smileFactor)
                    }
                }
                .frame(maxWidth: .infinity)
                Button("😑") {
                    withAnimation{
                        flip = 1 - flip
                    }
                }
                .frame(maxWidth: .infinity)
                Button("😩") {
                    withAnimation{
                        smileFactor = -abs(smileFactor)
                    }
                }
                .frame(maxWidth: .infinity)
            }.font(.largeTitle)
        }.padding()
    }
}

#Preview {
    Attributed_String_Demo()
}
