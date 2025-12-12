//
//  MovieRowView.swift
//  MovieSearch
//
//  Created by 이승준 on 11/15/25.
//


import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            poster
            
            VStack(alignment: .leading, spacing: 6) {
                Text(movie.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .lineLimit(2)
                
                HStack(spacing: 8) {
                    Text(movie.releaseYear)
                    
                    if let rating = movie.voteAverage, rating > 0 {
                        Text("★ \(String(format: "%.1f", rating))")
                    }
                }
                .font(.caption)
                .foregroundColor(.secondary)
                
                if let overview = movie.overview, !overview.isEmpty {
                    Text(overview)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(3)
                }
            }
            Spacer()
        }
        .padding(10)
        .background(
            RoundedRectangle(cornerRadius: 14)
                .fill(Color(.secondarySystemBackground).opacity(0.9))
        )
    }
    
    private var poster: some View {
        AsyncImage(url: movie.posterURL) { phase in
            switch phase {
            case .empty:
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color.gray.opacity(0.3))
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            case .failure:
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.gray, lineWidth: 1)
            @unknown default:
                Color.clear
            }
        }
        .frame(width: 70, height: 105)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
