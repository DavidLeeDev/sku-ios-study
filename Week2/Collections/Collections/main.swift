//
//  main.swift
//  Collections
//
//  Created by 이승준 on 9/12/25.
//

import Foundation

print("Hello, World!")

var favoriteNumbers: [Double] = [7, sqrt(2), Double.pi]

print(favoriteNumbers)

favoriteNumbers.append(12.345)

print(favoriteNumbers)

var manyZeros = Array(repeating: 0, count: 7)

var lotsOfHummus = Array(repeating: "Hummus", count: 7)

print(manyZeros)
print(lotsOfHummus)

//Iterate over an array
for number in favoriteNumbers{
    print("One of my favorite numbers is \(number)")
}

print(lotsOfHummus.isEmpty)
print(favoriteNumbers[0...1])
print(favoriteNumbers[0..<1])

favoriteNumbers.insert(91.3, at: 1)
print(favoriteNumbers)

for i in 0..<favoriteNumbers.count{
    print("One of my favorite numbers is \(favoriteNumbers[i])")
}

for(index, value) in favoriteNumbers.enumerated() {
    print("The number \(value) is my favorite number at position \(index+1).")
}
