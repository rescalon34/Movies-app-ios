//
//  SearchViewModel.swift
//  MoviesApp
//
//  Created by rescalon on 3/7/24.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    // MARK: Networking properties
    private var searchRepository: SearchRepositoryProtocol
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - Published properties
    @Published var isLoading: Bool = false
    @Published var trendingMovies: [Movie] = []
    
    // MARK: - Initializer
    init(searchRepository: SearchRepositoryProtocol = SearchRepository(NetworkManager())) {
        self.searchRepository = searchRepository
        
        getTrendingMovies()
    }
    
    // MARK: - Endpoint functions
    private func getTrendingMovies() {
        isLoading = true
        searchRepository.getTrendingMovies(timeWindow: TimeWindowFilter.day.rawValue)
            .sink { [weak self] (result: Result<MovieDataResponse, Error>) in
                switch result {
                case .success(let trendingMovies):
                    self?.isLoading = false
                    self?.trendingMovies = trendingMovies.results.map { $0.toDomain() }
                case .failure(let error):
                    self?.isLoading = false
                    print("error getting trending movies: \(error)")
                }
            }
            .store(in: &cancellable)
    }
}
