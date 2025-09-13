import UIKit

func printDash(){
    print("---------------")
}

//variables are mutable
//let constants are immutable

//var greeting = "Hello, playground"
//print(greeting)
//
//greeting = "likes Hummus"
//print(greeting)

var greeting = "Hello, playground"
print(greeting)

greeting = "likes Hummus"
print(greeting)

greeting = "David " + greeting
print(greeting)

var name = "David"
let likeHummus = "likes hummus"
greeting = name + " " + likeHummus
print(greeting)

let listOfPeople = ["Ron", "Jane", "Bob"]

print("----------")
for name in listOfPeople {
    greeting = name + " " + likeHummus + "."
    greeting = "\(name) \(likeHummus)."
    print(greeting)
}

print("----------")
greeting = "\(name) likes to skateboard."
print(greeting)

let names: [String] = ["Ron", "Elmo", "cookie", "big bird", "grover", "oscar"]

for name in names {
    print("\(name) likes to skateboard.")
}

struct PersonWithHobby {
    let name: String
    let hobby: String
}

let people: [PersonWithHobby] = [
    PersonWithHobby(
        name: "ron",
        hobby: "skateboard"
    ),
    PersonWithHobby(
        name: "cookie",
        hobby: "bake"
    ),
    PersonWithHobby(
        name: "elmo",
        hobby: "sing"
    ),
    PersonWithHobby(
        name: "jane",
        hobby: "soccer"
    ),
    PersonWithHobby(
        name: "david",
        hobby: ""
    ),

]

printDash()

for p in people {
    print("\(p.name.capitalized) likes to \(p.hobby)")
}

var x: Int = 7
var y: Int? = 10

x = 12345
y = 12345
y = -18
y = nil



struct PersonWithOptionalHobby {
    let name: String
    let hobby: String?
}

let people2: [PersonWithOptionalHobby] = [
    PersonWithOptionalHobby(
        name: "ron",
        hobby: "skateboard"
    ),
    PersonWithOptionalHobby(
        name: "cookie",
        hobby: "bake"
    ),
    PersonWithOptionalHobby(
        name: "elmo",
        hobby: "sing"
    ),
    PersonWithOptionalHobby(
        name: "jane",
        hobby: "soccer"
    ),
    PersonWithOptionalHobby(
        name: "david",
        hobby: nil
    ),
]

for p in people2{
    if let hobby = p.hobby {
        //Excuted if p.hobby != nil
        print("\(p.name.capitalized) likes to \(hobby)")
    }else {
        print("\(p.name.capitalized) has no hobby")
    }
    
//    if p.hobby == nil {
//        print("\(p.name) has no hobby")
//    } else{
//        print("\(p.name.capitalized) likes to \(String(describing: p.hobby))")
//    }
}
