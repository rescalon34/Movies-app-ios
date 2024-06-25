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
    private var genresCancellable = Set<AnyCancellable>()
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - Published properties
    @Published var movies: [Movie] = []
    @Published var genres: [Genre] = []
    @Published var selectedGenre: Genre = .default
    
    // MARK: - Initializer
    init(moviesRepository: MoviesRepositoryProtocol = MoviesRepository(NetworkManager())) {
        self.moviesRepository = moviesRepository
    }
    
    // MARK: - Endpoint Functions
    func getMovieGenres() {
        moviesRepository.getMovieGenres()
            .sink { [weak self] (result: Result<GenresDataResponse, Error>) in
                switch result {
                case .success(let movieGenres):
                    self?.genres = movieGenres.genres.map { $0.toDomain() }
                    self?.setupDefaultMovieGenre()
                    self?.getMovies()
                case .failure(let error):
                    print("error getting genres: \(error)")
                }
            }
            .store(in: &genresCancellable)
    }
    
    // Decides which movie data to fetch based on the selected category.
    func getMovies() {
        print("TELLSELECTED: \(selectedGenre)")
        if selectedGenre.name == LocalMovieGenres.Featured.rawValue {
            print("TELLSELECTED: INSIDE IF")
            getFeaturedMovies(type: "popular")
        } else {
            print("TELLSELECTED: INSIDE ELSE")
            getMoviesByGenre()
        }
    }
    
    // TODO, get this data only if the selected genre is "Featured"
    func getFeaturedMovies(type: String) {
        moviesRepository.getMovies(type: type)
            .sink { [weak self] (result: Result<MovieDataResponse, Error>) in
                switch result {
                case .success(let movieData):
                    self?.movies = movieData.results.map { $0.toDomain() }
                case .failure(let error):
                    print("error: \(error)")
                }
            }
            .store(in: &cancellable)
    }
    
    func getMoviesByGenre() {
        print("Get all movies by genres...")
    }
    
    // MARK: - View functions
    /// Append the "Default Featured Genre" to the first position of the genre list.
    func setupDefaultMovieGenre() {
        genres.insert(Genre.default, at: 0)
    }
}
