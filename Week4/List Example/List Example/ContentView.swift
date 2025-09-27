//
//  ContentView.swift
//  List Example
//
//  Created by 이승준 on 9/26/25.
//

import SwiftUI

struct ContentView: View {
    let people: [Person] = [
        .init(
            name: "Bert",
            hobby: "baseball",
            hobbyImage: "figure.baseball"
        ),
        .init(
            name: "Ernie",
            hobby: "cricket",
            hobbyImage: "figure.cricket"
        ),
        .init(
            name: "Big Bird",
            hobby: "Sky dives",
            hobbyImage: nil
        ),
        .init(
            name: "Cookie",
            hobby: "skateboard",
            hobbyImage: nil
        ),

    ]
    
    var body: some View {
        List {
            ForEach(people) { person in
                RowItem(person:person)
                    .listRowSeparator(.hidden)
            }
        }
    }
        
}


struct Person: Identifiable {
    let id = UUID()
    let name: String
    let hobby: String
    let hobbyImage: String?
}

#Preview {
    ContentView()
}
