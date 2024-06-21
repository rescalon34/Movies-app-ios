//
//  MoviesRepositoryProtocol.swift
//  MoviesApp
//
//  Created by rescalon on 17/6/24.
//

import Foundation
import Combine

protocol MoviesRepositoryProtocol {
    
    func getMovies(type: String) -> AnyPublisher<Result<MovieDataResponse, Error>, Never>
    
    func getMovieDetails(movieId: Int) -> AnyPublisher<Result<MovieDetailResponse, Error>, Never>
}
