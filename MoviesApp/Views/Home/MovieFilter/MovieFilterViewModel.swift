//
//  MovieFilterViewModel.swift
//  MoviesApp
//
//  Created by rescalon on 10/6/24.
//

import Foundation

class MovieFilterViewModel : ObservableObject {
    
    @Published var movieFilters: [String] = []
    
    init() {
        getMovieFilters()
    }
    
    func getMovieFilters() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.movieFilters = PreviewDataProvider.instance.movieFilters
        }
    }
}
