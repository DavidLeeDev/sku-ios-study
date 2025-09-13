//: [Previous](@previous)

import Foundation

// Examples of enumerations
func printXY( x: Double, y: Double) {
    print("\(x), \(y)")
}

//CGPoint
func printXY(point: CGPoint){
    let x = point.x
    let y = point.y
    print("\(x), \(y)")
}

enum Direction {
    case north, south, east, west
}

var x = 0.0
var y = 0.0
let delta = 5.0
var direction1 = Direction.east
var direction2: Direction = .north
var directions: [Direction] = [
    .north,
    .south,
    .west,
    .east,
    .east
]
printXY(x: x, y: y)

switch(direction1) {
case .east:
    x += delta
case .west:
    x -= delta
case .north:
    y -= delta
case .south:
    y += delta
}

printXY(x: x, y: y)

func updatePosition(direction: Direction, point: CGPoint) ->
    CGPoint {
        var x = point.x
        var y = point.y
        let delta = 5.0
        switch(direction) {
        case .east:
            x += delta
        case .west:
            x -= delta
        case .north:
            y -= delta
        case .south:
            y += delta
        }
        return CGPoint(x: x, y: y)
    }
print("Let's follow some directions.")
var thePoint: CGPoint = CGPoint(x: 0, y: 0)
printXY(point: thePoint)

for direction in directions {
    thePoint = updatePosition(direction: direction, point: thePoint)
    printXY(point: thePoint)
}

enum photoNames: String, CaseIterable {
    case dog1 = "pexel-puppy-chevanon.png"
    case dog2 = "pixabay12-puppy.jpg"
    case dog3 = "pexel3-puppy.png"
}
print("The filename for \(photoNames.dog1) is \(photoNames.dog1.rawValue)")
print("")
for photo in photoNames.allCases {
    print("The filename for \(photo) is \(photo.rawValue)")
}
//: [Next](@next)
