//
//  MovieDetailView.swift
//  MovieSearch
//
//  Created by 이승준 on 11/15/25.
//


import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @EnvironmentObject private var favoritesStore: FavoritesStore
    
    private var isFavorite: Bool {
        favoritesStore.isFavorite(movie)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                posterSection
                titleSection
                favoriteButton
                overviewSection
            }
            .padding()
        }
        .navigationTitle(movie.title)
    }
    
    private var posterSection: some View {
        AsyncImage(url: movie.posterURL) { phase in
            switch phase {
            case .empty:
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color.gray.opacity(0.3))
                    .frame(height: 320)
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 320)
                    .clipped()
            case .failure:
                RoundedRectangle(cornerRadius: 16)
                    .stroke(Color.gray, lineWidth: 1)
                    .frame(height: 320)
            @unknown default:
                Color.clear.frame(height: 320)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .frame(maxWidth: .infinity)
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(movie.title)
                .font(.title2.bold())
            
            HStack(spacing: 8) {
                Text(movie.releaseYear)
                if let rating = movie.voteAverage {
                    Text(String(format: "⭐️ %.1f / 10", rating))
                }
            }
            .font(.subheadline)
            .foregroundStyle(.secondary)
        }
    }
    
    private var favoriteButton: some View {
        Button {
            favoritesStore.toggle(movie)
        } label: {
            Text(isFavorite ? "즐겨찾기에서 제거" : "즐겨찾기에 추가")
                .font(.headline)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isFavorite ? Color.gray.opacity(0.4) : Color.accentColor)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        }
        .padding(.top, 8)
    }
    
    private var overviewSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("줄거리")
                .font(.headline)
            if let overview = movie.overview, !overview.isEmpty {
                Text(overview)
                    .font(.body)
            } else {
                Text("등록된 줄거리가 없습니다.")
                    .foregroundStyle(.secondary)
                    .font(.subheadline)
            }
        }
        .padding(.top, 8)
    }
}
