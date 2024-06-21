//
//  MovieDetailsViewModel.swift
//  MoviesApp
//
//  Created by rescalon on 18/6/24.
//

import Foundation
import Combine

class MovieDetailsViewModel: ObservableObject {
    
    // MARK: Networking properties
    private var moviesRepository: MoviesRepositoryProtocol
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - Published properties
    @Published var movie: Movie? = .default
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    
    // MARK: - Initializer
    init(moviesRepository: MoviesRepositoryProtocol = MoviesRepository(NetworkManager())) {
        self.moviesRepository = moviesRepository
        self.movie = movie
    }
    
    // MARK: API call functions
    func getMovieDetails(movieId: Int) {
        isLoading = true
        moviesRepository.getMovieDetails(movieId: movieId)
            .sink { [weak self] (result: Result<MovieDetailResponse, Error>) in
                switch result {
                case .success(let movieDetails):
                    self?.movie = movieDetails.toDomain()
                    self?.isLoading = false
                    print("Movie details: \(movieDetails)")
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print("errror getting movie details: \(error.localizedDescription)")
                    self?.isLoading = false
                }
            }
            .store(in: &cancellable)
    }
    
    // MARK: - Functions
    func getMovieTitle() -> String {
        return movie?.title ?? ""
    }
    
    func getOfficialTrailerVideoKey() -> String {
        return movie?.videos?.first(where: { video in
            video.type == VideoType.Trailer.rawValue
        })?.key ?? ""
    }
    
    func getReleaseDate() -> String {
        guard let releaseDate = movie?.releaseDate?.formatReleaseDate() else { return "" }
        return releaseDate
    }
    
    func getDurationTime() -> String {
        guard let durationTime = movie?.runtime?.formatRuntime() else { return "" }
        return durationTime
    }
    
    func getMovieGenres() -> String {
        guard let genres = movie?.genres, !genres.isEmpty else { return "" }
        return genres.map { $0.name }.joined(separator: ", ")
    }
    
    func getMovieSummary() -> String {
        return getReleaseDate() + "-" + getDurationTime() + "-" + getMovieGenres()
    }
    
    func getAllSegmentOptions() -> [String] {
        return MovieDetailSegmentOptions.allCases.map { $0.option }
    }
}
