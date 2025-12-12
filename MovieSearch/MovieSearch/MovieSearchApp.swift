//
//  MovieSearchApp.swift
//  MovieSearch
//
//  Created by 이승준 on 11/15/25.
//

import SwiftUI

@main
struct MovieSearchApp: App {
    @StateObject private var favoritesStore = FavoritesStore()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                MovieSearchView()
                    .tabItem {
                        Label("검색", systemImage: "magnifyingglass")
                    }
                
                FavoritesView()
                    .tabItem {
                        Label("즐겨찾기", systemImage: "heart.fill")
                    }
            }
            .environmentObject(favoritesStore)
            .preferredColorScheme(.dark)
            .tint(Color.purple)
        }
    }
}
