import SwiftUI

struct MovieSearchView: View {
    @StateObject private var viewModel = MovieSearchViewModel()
    
    private let backgroundGradient = LinearGradient(
        gradient: Gradient(colors: [Color.black, Color(red: 0.07, green: 0.07, blue: 0.15)]),
        startPoint: .top,
        endPoint: .bottom
    )
    
    var body: some View {
        NavigationStack {
            ZStack {
                backgroundGradient
                    .ignoresSafeArea()
                
                VStack(spacing: 16) {
                    searchField
                    
                    if viewModel.hasQuery && !viewModel.sortedMovies.isEmpty {
                        sortPicker
                    }
                    
                    content
                }
                .padding()
            }
            .navigationTitle("영화 검색")
        }
        .onAppear {
            viewModel.loadPopularIfNeeded()
        }
    }
   
    private var searchField: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.secondary)
            
            TextField("영화 제목을 입력하세요", text: $viewModel.query)
                .autocapitalization(.none)   // 구버전 호환
                .disableAutocorrection(true)
                .onSubmit {
                    viewModel.search()
                }
            
            if !viewModel.query.isEmpty {
                Button {
                    viewModel.clearSearch()
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(10)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
    }

    private var sortPicker: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(MovieSearchViewModel.SortOption.allCases) { option in
                    Button {
                        viewModel.sortOption = option
                    } label: {
                        Text(option.title)
                            .font(.caption)
                            .padding(.horizontal, 10)
                            .padding(.vertical, 6)
                            .background(
                                Capsule()
                                    .fill(viewModel.sortOption == option
                                          ? Color.accentColor
                                          : Color(.secondarySystemBackground).opacity(0.8))
                            )
                            .foregroundColor(viewModel.sortOption == option ? .white : .primary)
                    }
                }
            }
            .padding(.horizontal, 2)
        }
    }
    
    @ViewBuilder
    private var content: some View {
        if !viewModel.hasQuery {
            popularSection
        } else {
            searchSection
        }
    }

    private var popularSection: some View {
        Group {
            if viewModel.isLoadingPopular {
                Spacer()
                ProgressView("인기 영화 불러오는 중…")
                    .foregroundColor(.white)
                Spacer()
            } else if viewModel.popularMovies.isEmpty {
                Spacer()
                Text("인기 영화 정보를 불러올 수 없습니다.")
                    .foregroundColor(.secondary)
                Spacer()
            } else {
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("요즘 인기 영화")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        LazyVStack(spacing: 12) {
                            ForEach(viewModel.popularMovies) { movie in
                                NavigationLink(destination: MovieDetailView(movie: movie)) {
                                    MovieRowView(movie: movie)
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    
    private var searchSection: some View {
        Group {
            if viewModel.isLoading {
                Spacer()
                ProgressView("검색 중…")
                    .foregroundColor(.white)
                Spacer()
            } else if let message = viewModel.errorMessage {
                Spacer()
                Text(message)
                    .foregroundColor(.secondary)
                Spacer()
            } else if viewModel.sortedMovies.isEmpty {
                Spacer()
                Text("검색 결과가 없습니다.")
                    .foregroundColor(.secondary)
                Spacer()
            } else {
                ScrollView {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.sortedMovies) { movie in
                            NavigationLink(destination: MovieDetailView(movie: movie)) {
                                MovieRowView(movie: movie)
                            }
                        }
                    }
                }
            }
        }
    }
}
