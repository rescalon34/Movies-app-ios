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
    @Published var isLoading: Bool = false
    @Published var movies: [Movie] = []
    @Published var genres: [Genre] = []
    @Published var selectedGenre: Genre = .default
    
    // MARK: - Initializer
    init(moviesRepository: MoviesRepositoryProtocol = MoviesRepository(NetworkManager())) {
        self.moviesRepository = moviesRepository
        
        getMovieGenres()
        setupBindings()
    }
    
    
    // MARK: - Endpoint Functions
    func getMovieGenres() {
        isLoading = true
        moviesRepository.getMovieGenres()
            .sink { [weak self] (result: Result<GenresDataResponse, Error>) in
                switch result {
                case .success(let movieGenres):
                    self?.isLoading = false
                    self?.genres = movieGenres.genres.map { $0.toDomain() }
                    self?.setupDefaultMovieGenre()
                case .failure(let error):
                    self?.isLoading = false
                    print("error getting genres: \(error)")
                }
            }
            .store(in: &cancellable)
    }
    
    // Decides which movie data to fetch based on the selected category.
    func getMovies() {
        isLoading = true
        if selectedGenre.name == LocalMovieGenres.Featured.rawValue {
            getFeaturedMovies(type: "popular")
        } else {
            getMoviesByGenre()
        }
    }
    
    // TODO, get this data only if the selected genre is "Featured"
    func getFeaturedMovies(type: String) {
        moviesRepository.getMovies(type: type)
            .sink { [weak self] (result: Result<MovieDataResponse, Error>) in
                switch result {
                case .success(let movieData):
                    self?.isLoading = false
                    self?.movies = movieData.results.map { $0.toDomain() }
                case .failure(let error):
                    self?.isLoading = false
                    print("error: \(error)")
                }
            }
            .store(in: &cancellable)
    }
    
    func getMoviesByGenre() {
        moviesRepository.getMoviesByGenre(genreId: selectedGenre.id)
            .sink { [weak self] (result: Result<MovieDataResponse, Error>) in
                switch result {
                case .success(let movieData):
                    self?.movies = movieData.results.map { $0.toDomain() }
                    self?.isLoading = false
                case .failure(let error):
                    self?.isLoading = false
                    print("error getting movies by genre: \(error)")
                }
            }
            .store(in: &cancellable)
    }
    
    // MARK: - View functions
    /// Append the "Default Featured Genre" to the first position of the genre list.
    func setupDefaultMovieGenre() {
        genres.insert(Genre.default, at: 0)
    }
    
    private func setupBindings() {
        onSelectedGenreChange()
    }
    
    // This callback gets triggered when the selectedGenre changes, the `removeDuplicates()` function will avoid
    // executing again the other function to get movies.
    func onSelectedGenreChange() {
        $selectedGenre
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.getMovies()
            }
            .store(in: &cancellable)
    }
}
