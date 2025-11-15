//
//  RecipeModel.swift
//  recipe
//
//  Created by 이승준 on 11/15/25.
//

import Foundation

struct RecipeModel: Identifiable {
    let id = UUID()
    let name: String
    let caloriesPer100Grams: Int
    let recipe: String
    let recipeImage: String
    let recipeURL: String
}
