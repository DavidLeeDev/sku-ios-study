//
//  RowItem.swift
//  List Example
//
//  Created by 이승준 on 9/26/25.
//

import SwiftUI

struct RowItem: View {
    let person: Person
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 3){
                Text(person.name)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text(person.hobby.capitalized)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.orange)
            }
            Spacer()
            if let hobbyImage = person.hobbyImage {
                Image(systemName: hobbyImage)
                    .foregroundColor(.red)
                    .padding()
                    .background(Circle().stroke(.red))
            }
        }
        .padding()
        .background(Color.black.cornerRadius(10))
    }
        
}


#Preview {
    RowItem(person:  .init(
        name: "Bert",
        hobby: "baseball",
        hobbyImage: "figure.baseball"
    ),)
}




