//
//  MovieAPI.swift
//  MovieSearch
//
//  Created by 이승준 on 11/15/25.
//

import Foundation

final class MovieAPI {
    static let shared = MovieAPI()

    private let apiKey = "ec8c56301090243b74a49bc8b89eb620"
    
    private init() {}
    
    func search(query: String) async throws -> [Movie] {
        var components = URLComponents(string: "https://api.themoviedb.org/3/search/movie")!
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "query", value: query),
            URLQueryItem(name: "language", value: "ko-KR"),
            URLQueryItem(name: "include_adult", value: "false"),
            URLQueryItem(name: "page", value: "1")
        ]
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let http = response as? HTTPURLResponse,
              (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(MovieResponse.self, from: data).results
    }
    
    func fetchPopular() async throws -> [Movie] {
        var components = URLComponents(string: "https://api.themoviedb.org/3/movie/popular")!
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            URLQueryItem(name: "language", value: "ko-KR"),
            URLQueryItem(name: "page", value: "1")
        ]
        
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let http = response as? HTTPURLResponse,
              (200..<300).contains(http.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(MovieResponse.self, from: data).results
    }
}
