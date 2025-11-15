//
//  ListItemView.swift
//  recipe
//
//  Created by 이승준 on 11/15/25.
//

import SwiftUI

struct ListItemView: View {
    let name: String
    let caloriesPer100Grams: Int
    let recipeImage: String
    let imageDim: CGFloat = 100
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5){
                Text(name)
                    .foregroundStyle(.orange)
                Text("\(caloriesPer100Grams) calories per 100 grams")
                    .font(.caption)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
            }.padding()
                
            
            Spacer()
            
            Image(recipeImage)
                .resizable()
                .frame(width: imageDim, height: imageDim)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.white, lineWidth: 1)
                )
                .shadow(color: .red, radius: 10, x: 5, y: 5)
        }.padding()
            .background(Color.black.cornerRadius(10))
    }
}

#Preview {
    ListItemView(
        name: "Hummus",
        caloriesPer100Grams: 322,
        recipeImage: "IMGhummus"
    )
}
