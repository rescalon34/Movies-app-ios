//
//  HomeViewModel.swift
//  MoviesApp
//
//  Created by rescalon on 7/6/24.
//

import Foundation

class HomeViewModel : ObservableObject {
    
    // TODO, load data from API.
    @Published var movies = PreviewDataProvider.instance.movies
}
