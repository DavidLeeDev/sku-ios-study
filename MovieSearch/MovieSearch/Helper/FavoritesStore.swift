//
//  FavoritesStore.swift
//  MovieSearch
//
//  Created by 이승준 on 11/15/25.
//


import Foundation
import SwiftUI
internal import Combine

@MainActor
final class FavoritesStore: ObservableObject {
    @Published private(set) var favorites: [Movie] = []
    
    private let storageKey = "favoriteMovies"
    
    init() {
        load()
    }
    
    func isFavorite(_ movie: Movie) -> Bool {
        favorites.contains { $0.id == movie.id }
    }
    
    func toggle(_ movie: Movie) {
        if isFavorite(movie) {
            favorites.removeAll { $0.id == movie.id }
        } else {
            favorites.append(movie)
        }
        save()
    }
    
    private func save() {
        do {
            let data = try JSONEncoder().encode(favorites)
            UserDefaults.standard.set(data, forKey: storageKey)
        } catch {
            print("Failed to save favorites:", error)
        }
    }
    
    private func load() {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else { return }
        do {
            favorites = try JSONDecoder().decode([Movie].self, from: data)
        } catch {
            print("Failed to load favorites:", error)
        }
    }
}
