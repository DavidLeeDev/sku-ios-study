import UIKit

var greeting = "Hello, playground"

//Exercise 1:
//Display the numbers 5, 10, 15, 20, 25

for i in stride(from: 5, to: 30, by: 5){
    print(i)
}

for i in 0..<5 {
    print(5*i)
}

//Exercise 2:
//Given an integer a and an integer d and an integer n
//Display the numbers: a, a+d, a+2d,..., a+(n-1)d

//let a = 2
//let d = 3
//let n = 5
//
//for i in 1...n{
//    var num = a+(i-1)*d
//    print(num)
//}

func displayArithmeticProgression(a: Int, d: Int, n: Int) {
    for i in 1...n{
        var num = a+(i-1)*d
        print(num)
    }
}

displayArithmeticProgression(a: 5, d: 5, n: 5)
displayArithmeticProgression(a: 1, d: 3, n: 10)
