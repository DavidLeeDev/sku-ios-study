//
//  Pluralization Demo.swift
//  Text Exploration
//
//  Created by 이승준 on 10/18/25.
//

import SwiftUI

struct Pluralization_Demo: View {
    @State private var count = 0
    let nounList = [
        "bread", "salt", "domino", "radius", "child", "foot", "tooth"
    ]
    var body: some View {
        NavigationStack {
            VStack{
                Form{
                    ForEach(nounList, id:\.self){
                        noun in
                        LabeledContent(noun.capitalized){
                            Text("^[\(count) \(noun.capitalized)](inflect: true)")
                        }
                    }
                }
                Button("increment", systemImage: "plus.circle.fill",action: {count += 1})
            }
            .font(.title)
            .toolbar{
                ToolbarItem{
                    Button("Reset"){
                        count = 0
                    }
                }
            }
            .navigationTitle(Text("Pluralization Demo"))
        }
    }
}

#Preview {
    Pluralization_Demo()
}
