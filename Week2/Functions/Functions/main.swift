//
//  main.swift
//  Functions
//
//  Created by 이승준 on 9/12/25.
//

import Foundation

print("Functions")

func greet(person name: String, with greeting: String, _ isQuestion: Bool = false) -> String {
    return "\(greeting), \(name)\(isQuestion ? "?": "!")"
}

print(greet(person: "David", with:"How are you"))
print(greet(person: "David", with:"How are you", true))

print("\n\nvariadic")
func sum(numbers: Double...) ->Double {
    var sum = 0.0
    for number in numbers {
        sum += number
    }
    return sum
}

print(sum(numbers:3,10,-7))

func swap(a: inout Int, b: inout Int) {
    let temp = a
    a = b
    b = temp
}

var num1 = 13
var num2 = 17
print("\(num1), \(num2)")

swap(a: &num1, b: &num2)

print("\(num1), \(num2)")

print("\n\nFunctions Types")

func sumF(_ numbers: Double..., fn : (Double) -> Double) ->Double {
    var sum = 0.0
    for number in numbers {
        sum += fn(number)
    }
    return sum
}

func square(x: Double) -> Double {
    x*x
}

print(sumF(1,2,3, fn: square))
print(sumF(1,2,3, fn: sqrt))
print(sumF(1.1,1.9,1, fn: floor))
