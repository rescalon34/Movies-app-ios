//
//  SearchRepository.swift
//  MoviesApp
//
//  Created by rescalon on 3/7/24.
//

import Foundation
import Combine

class SearchRepository: SearchRepositoryProtocol {
    
    // MARK: Properties
    private var networkManager: NetworkManager
    
    // MARK: - Init
    init(_ networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getTrendingMovies(timeWindow: String) -> AnyPublisher<Result<MovieDataResponse, Error>, Never> {
        networkManager.requestPublisher(target: SearchAPI.getTrendingMovies(timeWindow: timeWindow))
    }
    
    func getCollection(keyword: String) -> AnyPublisher<Result<CollectionDataResponse, Error>, Never> {
        networkManager.requestPublisher(target: SearchAPI.getCollection(keyword: keyword))
    }
}
