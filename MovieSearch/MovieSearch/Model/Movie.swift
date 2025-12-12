//
//  Movie.swift
//  MovieSearch
//
//  Created by 이승준 on 11/15/25.
//

import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Identifiable, Codable, Hashable {
    let id: Int
    let title: String
    let overview: String?
    let posterPath: String?
    let backdropPath: String?
    let releaseDate: String?
    let voteAverage: Double?
    let popularity: Double?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case popularity
    }

    var posterURL: URL? {
        guard let path = posterPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }

    var backdropURL: URL? {
        guard let path = backdropPath else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w780\(path)")
    }

    var releaseYear: String {
        guard let date = releaseDate,
              let year = date.split(separator: "-").first else { return "—" }
        return String(year)
    }

    var displayRating: String {
        guard let rating = voteAverage, rating > 0 else { return "N/A" }
        return String(format: "%.1f", rating)
    }
}
