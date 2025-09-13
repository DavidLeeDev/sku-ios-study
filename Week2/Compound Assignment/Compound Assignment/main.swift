//
//  main.swift
//  Compound Assignment
//
//  Created by 이승준 on 9/11/25.
//

import Foundation

print("Compound operators")

var x = 2
print(x)

//x = x + 1
x+=1
print(x)

//x = x - 1
x-=1
print(x)

/// Computes the n-th element in the sequence: a1, a1+d, a1+2d,...
/// For example: The third element in the sequence
/// 1, 4, 7, 10, 13, ...
/// is the number 7
/// - Parameters:
///   - a1: The first element in the sequence/progression
///   - d: Difference/distance between consecutive elements
///   - n: Position
/// - Returns: The n-th element of the arithmetic progression
func arithmeticProgression(a1: Double, d: Double, n: Int) -> Double {
    return a1 + Double((n-1)) * d
}

//print(arithmeticProgression(a1: 1, d: 3, n: 1))
//print(arithmeticProgression(a1: 1, d: 3, n: 2))

//for i in 1...10 {
//    print(arithmeticProgression(a1: 1, d: 3, n: i))
//}


func sumArithmeticProgression(a1: Double, d: Double, n: Int) -> Double? {
    if n < 0 {
        return nil
    }
    var sum: Double = 0
    for i in 1...n{
        sum += arithmeticProgression(a1: a1, d: d, n: i)
    }
    return sum
}

print("Testing the function sumArithmeticProgresstion")

//if let sum = sumArithmeticProgreesion(a1: 1, d: 3, n: 4) {
//    print(sum)
//} else {
//    print("error")
//}
//
//if let sum = sumArithmeticProgreesion(a1: 1, d: 3, n: -1) {
//    print(sum)
//} else {
//    print("error")
//}

//print(sumArithmeticProgression(a1: 1, d: 3, n: -1))

func printSumArithmeticProgression(a1: Double, d: Double, n: Int) {
    if let sum = sumArithmeticProgression(a1: a1, d: d, n: n) {
        print(sum)
    } else {
        print("error")
    }
}
printSumArithmeticProgression(a1: 1, d: 3, n: 4)

func geometricProgression(a1: Double, q: Double, n: Int) -> Double {
    
    return a1 * pow(q, Double(n-1))
}

func sumGeometricProgression(a1: Double, q: Double, n: Int) -> Double? {
    if n<0 {
        return nil
    }
    var sum: Double = 0
    
    for i in 1...n {
        sum+=geometricProgression(a1: a1, q: q, n: i)
    }
    return sum
}

func printSumGeometricProgression(a1: Double, q: Double, n: Int){
    if let sum = sumGeometricProgression(a1: a1, q: q, n: n) {
        print(sum)
    }else{
        print("error")
    }
}

printSumGeometricProgression(a1: 1, q: 3, n: 4)

func evenProduct(n: Int)-> Int? {
    if n <= 0 {
        return nil
    }
    var product = 1
    
    for i in 1...n{
        product *= i*2
    }
    return product
}
if let evenProduct = evenProduct(n:0){
    print(evenProduct)
}else{
    print("error")
}
