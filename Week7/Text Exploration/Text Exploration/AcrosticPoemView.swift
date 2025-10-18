//
//  ContentView.swift
//  Text Exploration
//
//  Created by 이승준 on 10/18/25.
//

import SwiftUI

struct LineOfPoetry: Identifiable {
    let id = UUID()
    let line: String
    var firstChar: String {
        if let first = line.first {
            return String(first)
        }else{
            return ""
        }
    }
    var remainingLine: String {
        String(line.dropFirst())
    }
}

struct AcrosticPoemView: View {
    let poem: [LineOfPoetry]=[
        .init(line: "Dancing in the moonlight, free,"),
        .init(line: "Reaching for the stars, we see."),
        .init(line: "Every wish, a whispered stream,"),
        .init(line: "Aiming high, in every scheme.")
    ]
    var body: some View {
        VStack {
            Text("\(Text("D").foregroundStyle(.red).bold().font(.largeTitle))reams").font(.title)
            
            VStack(alignment: .leading){
                ForEach(poem){ line in
                    self.colorFirstLetterOfLineOfPoerty(line: line) 
                }
            }
            
        }
        .padding()
    }
    
    func colorFirstLetterOfLineOfPoerty(line: LineOfPoetry, color: Color = .blue) -> Text{
        Text("\(Text(line.firstChar).foregroundStyle(color).bold())\(line.remainingLine)").font(.title)
    }
}

#Preview {
    AcrosticPoemView()
}
