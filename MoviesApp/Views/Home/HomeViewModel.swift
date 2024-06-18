//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by rescalon on 7/6/24.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject {
    
    // MARK: Networking properties
    private var moviesRepository: MoviesRepositoryProtocol
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - Published properties
    @Published var movies: [Movie] = []
    
    // MARK: - Initializer
    init(moviesRepository: MoviesRepositoryProtocol = MoviesRepository(NetworkManager())) {
        self.moviesRepository = moviesRepository
    }
    
    // MARK: - Functions
    func getMovies(type: String) {
        moviesRepository.getMovies(type: type)
            .sink { [weak self] (result: Result<MovieResponse, Error>) in
                switch result {
                case .success(let movieData):
                    self?.movies = movieData.results
                case .failure(let error):
                    print("error: \(error)")
                }
            }
            .store(in: &cancellable)
    }
}
