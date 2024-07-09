//
//  AccountRepository.swift
//  MoviesApp
//
//  Created by rescalon on 30/6/24.
//

import Foundation
import Combine

class AccountRepository: AccountRepositoryProtocol {
    
    // MARK: Properties
    private var networkManager: NetworkManager
    
    // MARK: - Init
    init(_ networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getAccountState(movieId: Int) -> AnyPublisher<Result<AccountStatusResponse, Error>, Never> {
        networkManager.requestPublisher(target: AccountAPI.getAccountState(movieId: movieId))
    }
    
    func getWatchlistMovies(accountId: Int) -> AnyPublisher<Result<WatchlistMoviesDataResponse, Error>, Never> {
        return networkManager.requestPublisher(target: AccountAPI.getWatchlistMovies(accountId: accountId))
    }
    
    func addMovieToWatchlist(accountId: Int, request: AddMovieToWatchlistRequest) -> AnyPublisher<Result<AddMovieToWatchlistResponse, Error>, Never> {
        networkManager.requestPublisher(
            target: AccountAPI.addMovieToWatchlist(
                accountId: accountId,
                request: request
            )
        )
    }
}
