//
//  main.swift
//  Strings
//
//  Created by 이승준 on 9/11/25.
//

import Foundation

print("Strings Topic!\n\n")

let quote = "Learn from \nyesterday, \n\nLive for today, \n\nHope for \ntomorrow"
print(quote)
print("")
let multilineQuote = """
\tLearn from
yesterday,

\tLive for today,

Hope for
tomorrow.
"""
print(multilineQuote)

let einsteinQuote = "\"Learn from yesterday, Live for today, Hope for tomorrow\"-Albert Einstein."
print(einsteinQuote)

let einsteinQuoteRaw = #""Learn from yesterday, Live for today, Hope for tomorrow"-Albert Einstein."#
print(einsteinQuoteRaw)

print(einsteinQuote == einsteinQuoteRaw)

var myString = ""
myString += "hello"

let emptyString = ""
let emptyString2 = String()
let someString = "Pizza☺️"

if someString.isEmpty{
    print("The given string \(someString)is empty")
}else {
    print(#"The given string  "\#(someString.lowercased())" is not empty"#)
}

if someString.count == 1 {
    print("The string '\(someString)' has 1 character")
}else{
    print("The stirng '\(someString)' has \(someString.count) characters.")
}

var msg = "The string '\(someString)' has \(someString.count) character"

if someString.count == 1 {
    msg += "s"
}

let plural = someString.count == 1 ? "" : "s"
print("The stirng '\(someString)' has \(someString.count) character\(plural).")

// Loop over a string
for ch in someString {
    print(ch)
}

print(someString.dropFirst(3))
print(someString.dropLast(3))

let x:String = String(someString.dropLast())
