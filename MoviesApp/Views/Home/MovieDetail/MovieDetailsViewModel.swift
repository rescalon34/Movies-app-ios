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
    @Published private var selectedVideo: Video?
    
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
        return selectedVideo?.key ?? ""
    }
    
    /// Set the value for `selectedVideo` property.
    /// - Parameter video: The video to set as the new `selectedVideo`. If it's nil, it will default to the first
    /// trailer video from the movie list.
    ///
    /// Mostly, this function will be invoked from two places: from the PlayButton on the details screen and
    /// from the `video clips` segmented view list gets selected.
    ///
    /// If it's called from the PlayButton, we don't need to pass a video param and it will enter in the if condition.
    /// Otherwise, set the selected clip video from the list.
    ///
    func setSelectedVideo(video: Video? = nil) {
        if video == nil {
            selectedVideo = movie?.videos?.first(where: { video in
                video.type == VideoType.Trailer.rawValue
            })
        } else {
            selectedVideo = video
        }
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
