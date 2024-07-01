//
//  AccountProtocol.swift
//  MoviesApp
//
//  Created by rescalon on 30/6/24.
//

import Foundation
import Combine

protocol AccountRepositoryProtocol {
    
    func getWatchlistMovies(accountId: Int) -> AnyPublisher<Result<WatchlistMoviesDataResponse, Error>, Never>
}
