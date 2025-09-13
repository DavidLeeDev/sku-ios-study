//
//  main.swift
//  Closures
//
//  Created by 이승준 on 9/12/25.
//

import Foundation

print("Hello, World!")

func mathOp(a: Int, b: Int, fn: (Int, Int) -> Int) -> Int {
    fn(a, b)
}

func add(a: Int, b: Int) -> Int {
    a + b
}

func strange(a: Int, b: Int) -> Int {
    a + b - a * b + 1
}

print(mathOp(a: 3, b: 2, fn: add))
print(mathOp(a: 3, b: 2, fn: strange))
print(mathOp(a: 3, b: 2, fn: *))
print(mathOp(a: 3, b: 2, fn: {(a: Int, b: Int) -> Int in
    a + b - a * b + 1
} ))

print(mathOp(a: 5, b: 2) {(a, b) in a + b - a * b + 1})

let simpleClosure = {
    print("This is a very simple closure")
}

simpleClosure()
let someValue = simpleClosure

someValue()

let addClosure = {(a: Int, b: Int) -> Int in return a + b}

print(addClosure(3,5))
