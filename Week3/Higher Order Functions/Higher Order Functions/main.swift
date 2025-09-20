//
//  main.swift
//  Higher Order Functions
//
//  Created by 이승준 on 9/20/25.
//

import Foundation

func filterExample() {
    let list = [5, 8, 12, 3, 36, 102, 12, 60, 7, 17]
    
//    let evenList = list.filter{listItem in listItem % 2 == 0}
    let evenList = list.filter{$0 % 2 == 0}
    let oddList = list.filter{listItem in listItem % 2 == 1}
    let divisibleBySixList = list.filter{listItem in listItem % 6 == 0}
    
    print(list)
    print(evenList)
    print(oddList)
    print(divisibleBySixList)
}



func mapExample() {
    let numbers = [1, 2, 3, 4, 5]
    let squareNumbers = numbers.map {$0 * $0}
    
    var squaredNumbers2: [Int] = []
    for number in numbers {
        squaredNumbers2.append(number*number)
    }
    
    for number in numbers {
        print(number*number)
    }
    print(numbers)
    print(squareNumbers)
    print(squaredNumbers2)
}

func sortedExample() {
    let sesameStreetCharacter = ["big bird", "elmo", "cookie monster", "oscar the grouch", "bert", "ernie"]
    let sortedCharacters = sesameStreetCharacter.sorted(by: <).map{$0.uppercased().replacingOccurrences(of: " ", with: "-")}.map{$0.count>10 ? String($0.reversed()) : $0}
    
    print(sortedCharacters)
}

func reduceExample() {
    let numbers = [1,2,3,4,5]
    
    let sum = numbers.reduce(0, +)
    print("sum: \(sum)")
    
    let product = numbers.reduce(1, *)
    print("product: \(product)")
    
    let words = ["Hello", " ", "world", "!"]
    let concatString = words
        .reduce("", {(result, word) in return result+word})
    print(concatString)
    
    print(words.reduce("", {$0 + $1}))
    
    print(words.reduce(0, {$0 + $1.count}))
    print(words.reduce("", {$0 + $1}).count)
}

func compactMap() {
    let strings = ["1", "2", "tree", "four", "5", "Ice Cream"]
    let numbers = strings.compactMap {Int($0)}.map{$0 * $0}.reduce(0, +)
    print(numbers)
}

func joinedExample() {
    let words = ["Hello", " ", "world", "!"]
    print(words.joined())
    print(words.joined(separator: ","))
}

func flatMapExample() {
    let numbers = [[1,2,3],[4,5,6]]
    print(numbers.flatMap {$0})
    print(numbers.flatMap {$0}.filter {$0 % 2 == 0})
}

func splitExample() {
    let hi = "Hello World!"
    print(hi.split(separator: " "))
    print(hi.split(separator: ""))
}

func myRemoveOccurence(str: String, remove: String)->String {
    str.split(separator: remove).joined()
}

func enumberatedExample() {
    let sesameStreetCharacter = ["big bird", "elmo", "cookie monster", "oscar the grouch", "bert", "ernie"]
    for (index, value) in sesameStreetCharacter.enumerated() {
        print("index: \(index), value: \(value)")
    }
}
//filterExample()
//mapExample()
//sortedExample()
//reduceExample()
//compactMap()
//joinedExample()
//flatMapExample()
//splitExample()
//print(myRemoveOccurence(str: "hello world!", remove: "l"))
//enumberatedExample()
