//
//  main.swift
//  CodingExercises
//
//  Created by 이승준 on 9/19/25.
//

import Foundation

func divisibleBy7(number: Int) -> String {
    let remain: Int = number % 7
    var result: String
    if remain != 0 {
        result = "I am \(number) and I am not divisible by 7"
    } else {
        result = "I am \(number) and I am divisible by 7"
    }
    return result
}

print(divisibleBy7(number: -17))

func divisibleByD(number: Int, divisor: Int) -> String {
    return number % divisor == 0 ? "I am \(number) and I am divisible by \(divisor)" : "I am \(number) and I am not divisible by \(divisor)"
}

print(divisibleByD(number: 12, divisor: 4))
print(divisibleByD(number: 12, divisor: 5))

func powerFunc(base: Int, power: Int) -> Int? {
    if power < 0 {
        return nil
    }else if power == 0{
        return 1
    }else{
        var result: Int = base
        for _ in 1..<power{
            result *= base
        }
        return result
    }
}
if let num = powerFunc(base: 5, power: 3){
    print(num)
}else{
    print("Invalid input.")
}

func sumPowers(n: Int, power: Int) -> Int? {
    if n < 0 || power < 0 {
        return nil
    }else if power == 0 {
        return 1
    }else{
        var result: Int = 0
        for i in 1...n{
            var num: Int = i
            for _ in 1..<power{
                num *= i
            }
            result += num
        }
        return result
    }
}

if let num = sumPowers(n: 4, power: 0){
    print(num)
} else {
    print("Invalid input")
}

func countOccurences(list: [Int], countMe: Int)->(occurences: Int, msg: String){
    if list.contains(countMe){
        var num = 0
//        for i in 0..<list.count{
//            if countMe == list[i] {
//                num += 1
//            }
//        }
        for i in list{
            if countMe == i {
                num += 1
            }
        }
        return (countMe, "\(countMe) appears \(num) times on the list.")
    } else {
        return (countMe, "\(countMe) is not in the list.")
    }
}

print(countOccurences(list: [1000, 10, 1, 10, -3, 10, 10], countMe: 10))

func repChar(n: Int, ch: String) -> String {
//    var res = ch
//    for _ in 1..<n {
//        res += ch
//    }
//    return res
    return String(repeating: ch, count: n)
}

func rectCharStroke(n: Int, ch: String = "*") -> String {
    var res = ""
    if n <= 0{
        return "Invalid Input"
    } else if n == 1 || n == 2 {
        for _ in 0..<n{
            res += (repChar(n: n, ch: ch) + "\n")
        }
        return res
    } else {
//        var str = ch
        res += (repChar(n: n, ch: ch) + "\n")
//        for _ in 0..<n-2{
//            str += " "
//        }
//        str += ch
//        res += (str + "\n")
        for _ in 0..<n-2{
            res += "\(ch)\(repChar(n: n-2, ch: " "))\(ch)\n"
        }
        res += (repChar(n: n, ch: ch) + "\n")
        return res
    }
}

print(rectCharStroke(n: 4))

func triangleNumbersSquared(n: Int) -> Int {
    var res: Int = 0
    for i in 1...n{
        res += i
    }
    return res
}

func sumOfCubes(n: Int) -> Int {
    var res: Int = 1
    let base: Int = triangleNumbersSquared(n: n)
    for _ in 1...n{
        res *= base
    }
    return res
}

//for n in 1..<10 {
//    print(triangleNumbersSquared(n: n))
//    print(sumOfCubes(n: n))
//}

func myCosine(_ x: Double, threshold: Double = pow(10, -6)) -> Double {
    var base: Double = 0
    var factorial = 1.0
    var num: Double = .infinity
    var res: Double = 0
    var isEven = 1
    while num >= threshold {
        num = pow(x, base) / factorial
        isEven % 2 != 0 ? (res += num) : (res -= num)
        base += 2
        isEven += 1
        factorial *= (base-1)*base
    }
    return res
}

//func factorial(n: Int) -> Int {
//    var res = 1
//    if n == 0 {
//        return 1
//    }
//    for i in 1...n{
//        res *= i
//    }
//    return res
//}

let m = 18.0
//for i in stride(from: 0, to: m, by: 1) {
//    let angle: Double = (2 * Double.pi * i) / m
//    print(cos(angle))
//    print(myCosine(angle))
//    print("")
//}


func myLog(_ x: Double, threshold: Double = pow(10, -6))->Double{
    if x == 0 {
        return -Double.infinity
    }else if x<0{
        return Double.nan
    }else{
        var num: Double = 1
        var sign: Double = 1
        var res: Double = 0
        var n:Double = 1
        while abs(num) >= threshold {
            num = sign * pow(x-1, Double(n)) / Double(n)
            res += num
            n += 1
            sign *= -1
        }
        return res
    }
}

func compareLogarithms(x: Double) {
    print("log(\(x)) = \(log(x))")
    print("myLog(\(x)) = \(myLog(x))")
    print("")
}

//for x in stride(from: -10.0, to: 0.0, by: 1.0){
//    compareLogarithms(x: exp(x))
//}
