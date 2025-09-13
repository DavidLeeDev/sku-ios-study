//: [Previous](@previous)

import Foundation

print("Let's talk about data types.")
print("TOPICS: Int, Double, Float, \"Type of\"")
var a: Int = 6
a = a+1
print(a)
a += 1
print(a)

var b = 100
var c = 100.0

print("Type of 'b' is \(type(of: b)).")
print("Type of 'b' is \(type(of: c)).")

var d: Float = 100.0
print("The variable 'd' is of type \(type(of: d)).")

print("Largest integer is \(Int.max).")
print("Smallest integer is \(Int.min).")

print("Largest Double is \(Double.greatestFiniteMagnitude).")
print("Smallest Double is \(-Double.greatestFiniteMagnitude).")

print("Largest Float is \(Float.greatestFiniteMagnitude).")
print("Smallest Float is \(-Float.greatestFiniteMagnitude).")

//Division
print("Division")
print(7/2)
print(7.0/2)
print(7/2.0)
print(7/Double(2))

//let x = 112
//let quotient = x / 5
//let remainder = x % 5
//
//for divisor in 1..<10 {
//    let remainder = x % divisor
//    let quotient = x / divisor
//    if remainder == 0 {
//        print("\(x) = \(quotient) * \(divisor)")
//    } else {
//        print("\(x) = \(quotient) * \(divisor) + \(remainder)")
//    }
//}

func divisionAlgorithm(x: Int, divisor: Int) -> String {
    let result: String
    let remainder = x % divisor
    let quotient = x / divisor
    if remainder == 0 {
        result = "\(x) = \(quotient) * \(divisor)"
    } else {
        result = "\(x) = \(quotient) * \(divisor) + \(remainder)"
    }
    return result
}

for divisor in 1..<9 {
    print(divisionAlgorithm(x: 112, divisor: divisor))
}
//: [Next](@next)

