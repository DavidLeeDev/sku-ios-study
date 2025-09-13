//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

let x1: Bool = true
let x2: Bool = false

func guardExample(expr: Bool, str: String) {
    print("Welcome")
    guard (expr) else { //excute this closure if expr == false
        print("We are here because the expression is \(str) was false")
        return
    }
    print("Have a nice day.")
}

guardExample(expr: x1, str: "x1")
guardExample(expr: x2, str: "x2")
guardExample(expr: 1+1 == 3, str: "1+1 == 3")
guardExample(expr: 1+1 == 2, str: "1+1 == 2")

print("\n\nIn other words guard..else only executes its closure if the expression if false.")
//: [Next](@next)
