//
//  FavoritesView.swift
//  MovieSearch
//
//  Created by 이승준 on 11/15/25.
//


import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject private var favoritesStore: FavoritesStore
    
    private struct FavoriteSection: Identifiable {
        let year: String
        let movies: [Movie]
        var id: String { year }
    }
    
    private var sections: [FavoriteSection] {
        let grouped = Dictionary(grouping: favoritesStore.favorites) { $0.releaseYear }
        let sortedYears = grouped.keys.sorted(by: >)
        
        return sortedYears.compactMap { year in
            guard let movies = grouped[year] else { return nil }
            let sortedMovies = movies.sorted { $0.title < $1.title }
            return FavoriteSection(year: year, movies: sortedMovies)
        }
    }
    
    var body: some View {
        NavigationStack {
            Group {
                if favoritesStore.favorites.isEmpty {
                    emptyState
                } else {
                    List {
                        ForEach(sections) { section in
                            Section(header: Text(section.year)) {
                                ForEach(section.movies) { movie in
                                    NavigationLink(destination: MovieDetailView(movie: movie)) {
                                        MovieRowView(movie: movie)
                                    }
                                }
                                .onDelete { indexSet in
                                    for index in indexSet {
                                        let movie = section.movies[index]
                                        favoritesStore.toggle(movie)
                                    }
                                }
                            }
                        }
                    }
                    .listStyle(.insetGrouped)
                }
            }
            .navigationTitle("즐겨찾기")
        }
    }
    
    private var emptyState: some View {
        VStack(spacing: 12) {
            Image(systemName: "heart.slash")
                .font(.system(size: 40))
                .foregroundColor(.secondary)
            Text("아직 즐겨찾기가 없습니다.")
                .foregroundColor(.secondary)
            Text("보고 싶은 영화를 검색해서 즐겨찾기에 추가해보세요.")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
