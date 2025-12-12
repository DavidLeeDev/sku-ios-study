//
//  MovieSearchViewModel.swift
//  MovieSearch
//
//  Created by 이승준 on 11/15/25.
//


import Foundation
internal import Combine

@MainActor
final class MovieSearchViewModel: ObservableObject {
    
    enum SortOption: CaseIterable, Identifiable {
        case relevance     // 기본: API 결과 순서
        case rating        // 평점순
        case recent        // 최신순
        
        var id: Self { self }
        
        var title: String {
            switch self {
            case .relevance: return "관련순"
            case .rating:    return "평점순"
            case .recent:    return "최신순"
            }
        }
    }
    
    @Published var query: String = ""
    @Published private(set) var movies: [Movie] = []
    @Published private(set) var popularMovies: [Movie] = []
    
    @Published var sortOption: SortOption = .relevance
    @Published var isLoading: Bool = false
    @Published var isLoadingPopular: Bool = false
    @Published var errorMessage: String? = nil
    
    private let api = MovieAPI.shared
    
    var hasQuery: Bool {
        !query.trimmingCharacters(in: .whitespaces).isEmpty
    }
    
    /// 정렬이 적용된 검색 결과
    var sortedMovies: [Movie] {
        switch sortOption {
        case .relevance:
            return movies
        case .rating:
            return movies.sorted { ($0.voteAverage ?? 0) > ($1.voteAverage ?? 0) }
        case .recent:
            return movies.sorted { ($0.releaseDate ?? "") > ($1.releaseDate ?? "") }
        }
    }
    
    func search() {
        let trimmed = query.trimmingCharacters(in: .whitespaces)
        guard !trimmed.isEmpty else {
            movies = []
            errorMessage = nil
            return
        }
        
        Task {
            isLoading = true
            errorMessage = nil
            do {
                let result = try await api.search(query: trimmed)
                movies = result
            } catch {
                print("Search error:", error)
                errorMessage = "검색 중 오류가 발생했습니다. 잠시 후 다시 시도해주세요."
            }
            isLoading = false
        }
    }
    
    func loadPopularIfNeeded() {
        guard popularMovies.isEmpty else { return }
        
        Task {
            await loadPopular()
        }
    }
    
    private func loadPopular() async {
        isLoadingPopular = true
        do {
            let result = try await api.fetchPopular()
            popularMovies = result
        } catch {
            print("Popular fetch error:", error)
        }
        isLoadingPopular = false
    }
    
    func clearSearch() {
        query = ""
        movies = []
        errorMessage = nil
        sortOption = .relevance
    }
}
