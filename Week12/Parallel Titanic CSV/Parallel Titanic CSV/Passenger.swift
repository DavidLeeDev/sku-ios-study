//
//  Passenger.swift
//  Parallel Titanic CSV
//
//  Created by 이승준 on 11/29/25.
//


struct Passenger: Identifiable {
    let id: Int
    let survived: Bool
    let pclass: Int
    let name: String
    let sex: String
    let age: Int
}