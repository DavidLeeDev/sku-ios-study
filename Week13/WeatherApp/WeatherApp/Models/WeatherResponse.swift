//
//  WeatherResponse.swift
//  WeatherApp
//
//  Created by 이승준 on 12/6/25.
//


import Foundation

// MARK: - WeatherResponse
struct WeatherResponse: Codable {
    let location: Location
    let current: Current
}

// MARK: - Current
struct Current: Codable {
    let tempC: Double
    let tempF: Double
    let condition: Condition
    let feelslikeC: Double
    let feelslikeF: Double

    enum CodingKeys: String, CodingKey {
        case tempC = "temp_c"
        case tempF = "temp_f"
        case condition
        case feelslikeC = "feelslike_c"
        case feelslikeF = "feelslike_f"
    }
}

// MARK: - Condition
struct Condition: Codable {
    let text: String
    let icon: String
}

// MARK: - Location
struct Location: Codable {
    let name: String
    let country: String

    enum CodingKeys: String, CodingKey {
        case name, country
    }
}
