//
//  RecipeViewModel.swift
//  recipe
//
//  Created by 이승준 on 11/15/25.
//

import Foundation
import Observation

@Observable class RecipeViewModel {
    var recipeModels: [RecipeModel] = []
    
    init() {
        recipeModels.append(
            RecipeModel(
                name: "Hummus",
                caloriesPer100Grams: 322,
                recipe: """
                    
                **Ingredients**

                - 1 (15-ounce) can chickpeas or 1 ½ cups (250 grams) cooked chickpeas
                - 1/4 cup (60 ml) fresh lemon juice, 1 large lemon
                - 1/4 cup (60 ml) well-stirred tahini, see our homemade tahini recipe
                - 1 small garlic clove, minced
                - 2 tablespoons (30 ml) extra-virgin olive oil, plus more for serving
                - 1/2 teaspoon ground cumin
                - Salt to taste
                - 2 to 3 tablespoons (30 to 45 ml) water or aquafaba
                - Dash ground paprika or sumac

                """,
                recipeImage: "IMGhummus",
                recipeURL: "https://www.naver.com"
            )
        )
        
        recipeModels.append(
            RecipeModel(
                name: "Apple Pie",
                caloriesPer100Grams: 237,
                recipe: """
                    ** Ingredients**
                    - Apple
                    - Butter
                    - Salt
                    - Cold water
                    """,
                recipeImage: "IMGApplePie",
                recipeURL: "https://www.naver.com"
            )
        )
        recipeModels.append(
            RecipeModel(
                name: "Pizza",
                caloriesPer100Grams: 400,
                recipe: """
                    ** Ingredients**
                    -...
                    -...
                    -...
                    """,
                recipeImage: "IMGPizza",
                recipeURL: "https://www.naver.com"
            )
        )
        recipeModels.append(
            RecipeModel(
                name: "Hummus",
                caloriesPer100Grams: 322,
                recipe: """
                    ** Ingredients**
                    -...
                    -...
                    -...
                    """,
                recipeImage: "IMGhummus",
                recipeURL: "https://www.naver.com"
            )
        )
        
        recipeModels.append(
            RecipeModel(
                name: "Apple Pie",
                caloriesPer100Grams: 237,
                recipe: """
                    ** Ingredients**
                    -...
                    -...
                    -...
                    """,
                recipeImage: "IMGApplePie",
                recipeURL: "https://www.naver.com"
            )
        )
        recipeModels.append(
            RecipeModel(
                name: "Pizza",
                caloriesPer100Grams: 400,
                recipe: """
                    ** Ingredients**
                    -...
                    -...
                    -...
                    """,
                recipeImage: "IMGPizza",
                recipeURL: "https://www.naver.com"
            )
        )

        recipeModels.append(
            RecipeModel(
                name: "Hummus",
                caloriesPer100Grams: 322,
                recipe: """
                    ** Ingredients**
                    -...
                    -...
                    -...
                    """,
                recipeImage: "IMGhummus",
                recipeURL: "https://www.naver.com"
            )
        )
        
        recipeModels.append(
            RecipeModel(
                name: "Apple Pie",
                caloriesPer100Grams: 237,
                recipe: """
                    ** Ingredients**
                    -...
                    -...
                    -...
                    """,
                recipeImage: "IMGApplePie",
                recipeURL: "https://www.naver.com"
            )
        )
        recipeModels.append(
            RecipeModel(
                name: "Pizza",
                caloriesPer100Grams: 400,
                recipe: """
                    ** Ingredients**
                    -...
                    -...
                    -...
                    """,
                recipeImage: "IMGPizza",
                recipeURL: "https://www.naver.com"
            )
        )

        recipeModels.append(
            RecipeModel(
                name: "Hummus",
                caloriesPer100Grams: 322,
                recipe: """
                    ** Ingredients**
                    -...
                    -...
                    -...
                    """,
                recipeImage: "IMGhummus",
                recipeURL: "https://www.naver.com"
            )
        )
        
        recipeModels.append(
            RecipeModel(
                name: "Apple Pie",
                caloriesPer100Grams: 237,
                recipe: """
                    ** Ingredients**
                    -...
                    -...
                    -...
                    """,
                recipeImage: "IMGApplePie",
                recipeURL: "https://www.naver.com"
            )
        )
        recipeModels.append(
            RecipeModel(
                name: "Pizza",
                caloriesPer100Grams: 400,
                recipe: """
                    ** Ingredients**
                    -...
                    -...
                    -...
                    """,
                recipeImage: "IMGPizza",
                recipeURL: "https://www.naver.com"
            )
        )

        recipeModels.append(
            RecipeModel(
                name: "Hummus",
                caloriesPer100Grams: 322,
                recipe: """
                    ** Ingredients**
                    -...
                    -...
                    -...
                    """,
                recipeImage: "IMGhummus",
                recipeURL: "https://www.naver.com"
            )
        )
        
        recipeModels.append(
            RecipeModel(
                name: "Apple Pie",
                caloriesPer100Grams: 237,
                recipe: """
                    ** Ingredients**
                    -...
                    -...
                    -...
                    """,
                recipeImage: "IMGApplePie",
                recipeURL: "https://www.naver.com"
            )
        )
        recipeModels.append(
            RecipeModel(
                name: "Pizza",
                caloriesPer100Grams: 400,
                recipe: """
                    ** Ingredients**
                    -...
                    -...
                    -...
                    """,
                recipeImage: "IMGPizza",
                recipeURL: "https://www.naver.com"
            )
        )

    }
}
