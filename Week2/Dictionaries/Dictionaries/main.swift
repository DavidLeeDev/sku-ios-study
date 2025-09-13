//
//  main.swift
//  Dictionaries
//
//  Created by 이승준 on 9/12/25.
//

import Foundation

print("Dictionaries")

//var foodCalories: [String: Int] = [:]
//foodCalories["apple"] = 95
//foodCalories["banana"] = 105
//foodCalories["salad"] = 100
//foodCalories["pizza"] = 295

var foodCalories: [String: Int] = [
    "banana": 105, "pizza": 285
]

print(foodCalories)

if let calories = foodCalories["cake"]{
    print(calories)
} else{
    foodCalories["cake"] = 350
}

let calories: Int = foodCalories["banana", default: 0]

print(foodCalories)

for (k, v) in foodCalories {
    print("The number of calories in a \(k) is \(v) calories")
}

print(foodCalories.keys)
print(foodCalories.values)
//foodCalories.removeAll()
//print(foodCalories.keys)
//print(foodCalories.values)
foodCalories.removeValue(forKey: "banana")
print(foodCalories)
