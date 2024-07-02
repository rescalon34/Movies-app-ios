//
//  WatchlistMovieViewModel.swift
//  MoviesApp
//
//  Created by rescalon on 30/6/24.
//

import Foundation
import Combine

class WatchlistMovieViewModel: ObservableObject {
    
    // MARK: Networking properties
    private var accountRepository: AccountRepositoryProtocol
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - Published properties
    @Published var isLoading: Bool = false
    @Published var movies: [Movie] = []
    @Published var selectedMovie: Movie? = nil
    
    // MARK: - Initializer
    init(accountRepository: AccountRepositoryProtocol = AccountRepository(NetworkManager())) {
        self.accountRepository = accountRepository
        
        getWatchlistMovies()
    }
    
    // MARK: - Endpoint Functions
    func getWatchlistMovies() {
        isLoading = true
        accountRepository.getWatchlistMovies(accountId: ACCOUNT_ID)
            .sink { [weak self] (result: Result<WatchlistMoviesDataResponse, Error>) in
                switch result {
                case .success(let watchlistMovies):
                    self?.isLoading = false
                    self?.movies = watchlistMovies.results?.map { $0.toDomain() } ?? []
                case .failure(let error):
                    self?.isLoading = false
                    print("error getting watchlist: \(error)")
                }
            }
            .store(in: &cancellable)
    }
}
