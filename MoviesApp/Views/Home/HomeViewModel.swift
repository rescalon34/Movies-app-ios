//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by rescalon on 7/6/24.
//

import Foundation

class HomeViewModel : ObservableObject {
    
    private let networkManager = NetworkManager()
    
    // TODO, load data from API.
//    @Published var movies = PreviewDataProvider.instance.movies
    @Published var movies: [Movie] = []
    
    init() {
        loadMovies()
    }
    
    private func loadMovies() {
        networkManager.getMovies(type: "popular") { [weak self] result in
            switch result {
            case .success(let movieResponse):
                print("movies: \(movieResponse.results)")
                self?.movies = movieResponse.results
                
            case .failure(let error):
                print("error fetching movies: \(error)")
            }
        }
    }
}
