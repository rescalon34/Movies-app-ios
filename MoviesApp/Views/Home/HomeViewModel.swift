//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by rescalon on 7/6/24.
//

import Foundation
import Combine

class HomeViewModel : ObservableObject {
    
    private let networkManager = NetworkManager()
    private var cancellable = Set<AnyCancellable>()
    
    
    // TODO, load data from API.
    //    @Published var movies = PreviewDataProvider.instance.movies
    @Published var movies: [Movie] = []
    
    init() {
        getMovies()
    }

    private func getMovies() {
        networkManager.getMovies(type: "popular")
            .sink { [weak self] result in
                switch result {
                case .success(let response):
                    self?.movies = response.results
                case .failure(let error):
                    print("error: \(error)")
                }
            }
            .store(in: &cancellable)
    }
}
