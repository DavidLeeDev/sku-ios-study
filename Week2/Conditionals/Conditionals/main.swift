//
//  main.swift
//  Conditionals
//
//  Created by 이승준 on 9/12/25.
//

import Foundation

print("Conditionals")

let hoursSlept = 6
if hoursSlept < 6 {
    print("I'm not happy")
} else if hoursSlept > 6 && hoursSlept<=10 {
    print("I feel great")
} else{
    print("Sleeping too much")
}

let happiness: String = if hoursSlept < 6 {
    "I'm not happy"
} else if hoursSlept > 6 && hoursSlept<=10 {
    "I feel great"
} else{
    "Sleeping too much"
}

for hoursSlept in [3,8,11] {
    let happiness: String = if hoursSlept < 6 {
        "I'm not happy"
    } else if hoursSlept > 6 && hoursSlept<=10 {
        "I feel great"
    } else{
        "Sleeping too much"
    }
    print(happiness)
}

let x = if hoursSlept > 0 {
    Double(0)
}else{
    7.3
}

let validSleep: String? = if hoursSlept >= 0 {
    "Sleep is vaild"
}else{
    nil
}
//
//let isValidSleep: Bool = if hoursSlept >= 0 {
//    true
//} else {
//    false
//}


let isValidSleep: Bool = hoursSlept >= 0

let someValue = hoursSlept > 17 ? "Amazing" : "Oh no!"
let anotherValue = hoursSlept > 0 ? 0 : 7.3

let dayOfWeek = "Wednesday"
switch dayOfWeek {
case "Monday":
    print("It's the start of the work week")
case "Tuesday":
    print("It's still early in the week")
case "Wednesday":
    print("It's week is halfway through")
case "Thursday":
    print("The weekend is approaching")
case "Friday":
    print("It's the end of the work week")
case "Saturday", "Sunday":
    print("Yes! It is the weekend")
default:
    print("Invalid day of the week!")
}


let message: String = switch dayOfWeek {
case "Monday":
    "It's the start of the work week"
case "Tuesday":
    "It's still early in the week"
case "Wednesday":
    "It's week is halfway through"
case "Thursday":
    "The weekend is approaching"
case "Friday":
    "It's the end of the work week"
case "Saturday", "Sunday":
    "Yes! It is the weekend"
default:
    "Invalid day of the week!"
}

print(message)

func positionDescription(point: (x: Int, y: Int))->String {
    switch point{
    case (0,0):
        "\(point) is at the origin"
    case (_,0):
        "\(point) is on the x-axis"
    case (0,_):
        "\(point) is on the y-axis"
    case (0...,0...):
        "\(point) is in the first quadrant"
    case (...0,0...):
        "\(point) is in the second quadrant"
    case (...0,...0):
        "\(point) is in the third quadrant"
    case (0...,...0):
        "\(point) is in the fourth quadrant"
    default:
        "\(point) is at an unknown position"
    }
}

print(positionDescription(point:(2,2)))
print(positionDescription(point:(-2,2)))
print(positionDescription(point:(2,-2)))
print(positionDescription(point:(-2,-2)))

func onSineOrCosine(point: (x: Double, y: Double), threshold: Double = 0.01) -> String {
    return switch point {
    case let (x,y) where (y <= sin(x) + threshold || y >= sin(x) - threshold) || (y <= cos(x) + threshold && y >= cos(x) - threshold):
        "\(point) is on sine, cosine or both"
    default:
        "\(point) is not on sine or cosine"
    }
}

print(onSineOrCosine(point: (5, sin(5))))
