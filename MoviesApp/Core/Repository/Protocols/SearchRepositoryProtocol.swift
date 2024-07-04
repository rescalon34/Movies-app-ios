//
//  SearchRepository.swift
//  MoviesApp
//
//  Created by rescalon on 3/7/24.
//

import Foundation
import Combine

protocol SearchRepositoryProtocol {
    
    func getTrendingMovies(timeWindow: String) -> AnyPublisher<Result<MovieDataResponse, Error>, Never>
    
    func getCollection(keyword: String) -> AnyPublisher<Result<CollectionDataResponse, Error>, Never>
}
