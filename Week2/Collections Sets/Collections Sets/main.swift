//
//  main.swift
//  Collections Sets
//
//  Created by 이승준 on 9/12/25.
//

import Foundation

print("Sets")

var setOfNumbers = Set([1,5,7,3,3,1,5,5])

print(setOfNumbers)

var fruits: Set<String> = ["apple", "kiwi", "banana"]

print(fruits)

var A = Set([1,2,3])
var B = Set([2,3,4])

print(A.union(B))
print(A.intersection(B))
print(A.subtracting(B))

for a in A {
    print(a)
}

print(A.isSubset(of: B))
print(A.contains(20))


