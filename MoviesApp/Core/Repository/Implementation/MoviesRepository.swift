//
//  MoviesRepository.swift
//  MoviesApp
//
//  Created by rescalon on 17/6/24.
//

import Foundation
import Combine

/// Handle all movie API transactions here (get, post, put, etc)
class MoviesRepository: MoviesRepositoryProtocol {
    
    private var networkManager: NetworkManager
    
    // As a recommended approach, the networkManager must be injected
    // from higher-level to keep repository logic decoupled.
    init(_ networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getMovies(type: String) -> AnyPublisher<Result<MovieDataResponse, Error>, Never> {
        networkManager.requestPublisher(target: MoviesAPI.getMovies(type: type))
    }
    
    func getMovieDetails(movieId: Int) -> AnyPublisher<Result<MovieDetailResponse, Error>, Never> {
        networkManager.requestPublisher(target: MoviesAPI.getMovieDetails(movieId: movieId))
    }
    
    func getSuggestedMovies(movieId: Int) -> AnyPublisher<Result<SuggestedMoviesDataResponse, Error>, Never> {
        networkManager.requestPublisher(target: MoviesAPI.getSuggestedMovies(movieId: movieId))
    }
}
