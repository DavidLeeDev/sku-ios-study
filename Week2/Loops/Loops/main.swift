//
//  main.swift
//  Loops
//
//  Created by 이승준 on 9/12/25.
//

import Foundation

for i in 1...5{
    print(i)
}

let data = ["tree", "house", "dinner"]
for item in data {
    print(item)
}

for _ in 0..<10 {
    print("Hello World!")
}

let minuteInterval = 4
let minutes = 60
for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
    print(tickMark)
}

let n = 15
var i = 0
var sum = 0
while(i<n){
    sum += i
    i+=1
}

print("The sum of the values from 0 to \(n)")

//repeat {
//    print("forever")
//} while(true)
