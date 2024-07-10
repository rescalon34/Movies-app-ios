//
//  AccountProtocol.swift
//  MoviesApp
//
//  Created by rescalon on 30/6/24.
//

import Foundation
import Combine

protocol AccountRepositoryProtocol {
    
    func getAccountState(movieId: Int) -> AnyPublisher<Result<AccountStatusResponse, Error>, Never>
    
    func getWatchlistMovies(accountId: Int) -> AnyPublisher<Result<WatchlistMoviesDataResponse, Error>, Never>
    
    func addMovieToWatchlist(accountId: Int, request: AddMovieToWatchlistRequest) -> AnyPublisher<Result<AddMovieToWatchlistResponse, Error>, Never>
}
