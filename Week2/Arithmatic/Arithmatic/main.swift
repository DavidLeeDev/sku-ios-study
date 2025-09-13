//
//  main.swift
//  Arithmatic
//
//  Created by 이승준 on 9/11/25.
//

import Foundation

func add(_ x: Int,_ y: Int) -> String {
    "\(x) + \(y) = \(x+y)"
}
func subtract(_ x: Int,_ y: Int) -> String {
    return "\(x) - \(y) = \(x-y)"
}
func multiply(_ x: Int,_ y: Int) -> String {
    return "\(x) * \(y) = \(x*y)"
}
func divide(_ x: Int,_ y: Int) -> String? {
    if y == 0 {
        return nil
    }else{
        return "\(x) / \(y) = \(x/y)"
    }
    
}
func modulo(_ x: Int,_ y: Int) -> String? {
    y == 0 ? nil : "\(x) % \(y) = \(x%y)"
}
func division(x: Int, y: Int) -> String? {
    if y == 0 {
        return nil
    }else{
        let q = x/y
        let r = x%y
        return "\(x) = \(q) * \(y) + \(r)"
    }
}


print("Arithmetic Demo")


var x = 2
var y = 3
print("\(x) + \(y) = \(x+y)")

x = 5
y = 7
print("\(x) + \(y) = \(x+y)")

x = 10
y = 1204
print("\(x) + \(y) = \(x+y)")
//print("2 + 3 = \(2+3)")
//print("5 + 7 = \(5+7)")


print(add(2, 3))
print(add(5, 7))
print(add(10, 1204))

print(subtract(10, 3))
print(multiply(10, 3))
print(divide(10, 3))
print(modulo(10, 3))
print(division(x: 17, y: 3))
print(division(x: 17, y: 0))
