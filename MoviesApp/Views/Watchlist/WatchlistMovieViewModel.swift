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
    @Published var isAddedToWatchlist: Bool = true
    
    // MARK: - Initializer
    init(accountRepository: AccountRepositoryProtocol = AccountRepository(NetworkManager())) {
        self.accountRepository = accountRepository
        
        setupBindings()
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
                    self?.isAddedToWatchlist = true
                case .failure(let error):
                    self?.isLoading = false
                    print("error getting watchlist: \(error)")
                }
            }
            .store(in: &cancellable)
    }
    
    // MARK: - View functions
    private func setupBindings() {
        onAddToWatchlistChange()
    }
    
    // listen for changes whenever the movie watchlist state changes.
    // if it's different from the initial state, then make a request to update the watchlist
    // items on the screen, otherwise don't trigger the API endpoint.
    func onAddToWatchlistChange() {
        $isAddedToWatchlist
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] value in
                print("tellShouldRefresh: \(value)")
                self?.getWatchlistMovies()
            }
            .store(in: &cancellable)
    }
}
