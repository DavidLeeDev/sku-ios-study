//
//  ShowRecipeView.swift
//  recipe
//
//  Created by 이승준 on 11/15/25.
//

import SwiftUI

struct ShowRecipeView: View {
    let theRecipe: String
    let imageName: String
    let recipeURL: String
    
    var body: some View {
        ZStack{
            Color.gray.ignoresSafeArea()
            
            VStack{
                ScrollView{
                    Text(.init(theRecipe))
                        .padding()
                }
                Spacer()
                Link(
                    destination: URL(string: recipeURL)!,
                    label: {
                        ZStack{
                            Image(imageName)
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                                .scaleEffect(0.8)
                            Text("Click image for recipe")
                                .foregroundStyle(.orange)
                        }
                    }
                )
            }
        }
    }
}
