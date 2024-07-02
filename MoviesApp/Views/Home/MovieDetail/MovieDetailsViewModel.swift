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
    private var accountRepository: AccountRepositoryProtocol
    private var movieDetailsCancellable = Set<AnyCancellable>()
    private var suggestedMoviesCancellable = Set<AnyCancellable>()
    
    // MARK: - Published properties
    @Published var movie: Movie? = .default
    @Published var suggestedMovies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    @Published private var selectedVideo: Video?
    @Published var selectedSegment: String = ""
    @Published var isPlayerPresented = false
    @Published var isMovieInWatchlist: Bool = false
    
    // MARK: - Initializer
    init(
        moviesRepository: MoviesRepositoryProtocol = MoviesRepository(NetworkManager()),
        accountRepository: AccountRepositoryProtocol = AccountRepository(NetworkManager())
    ) {
        self.moviesRepository = moviesRepository
        self.accountRepository = accountRepository
        self.movie = movie
        self.selectedSegment = MovieDetailSegmentOptions.suggested.rawValue
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
                    
                    // get suggested movies after the movie details request.
                    self?.getSuggestedMovies(movieId: movieId)
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.isLoading = false
                }
            }
            .store(in: &movieDetailsCancellable)
    }
    
    func getSuggestedMovies(movieId: Int) {
        isLoading = true
        moviesRepository.getSuggestedMovies(movieId: movieId)
            .sink { [weak self] (result: Result<SuggestedMoviesDataResponse, Error>) in
                switch result {
                case .success(let movies):
                    self?.isLoading = false
                    self?.suggestedMovies = movies.results?.map { $0.toDomain() } ?? []
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.isLoading = false
                }
            }
            .store(in: &suggestedMoviesCancellable)
    }
    
    // Add/Remove a movie from the watchlist depending on the `isMovieInWatchlist` flag.
    func onAddMovieToWatchlist() {
        isMovieInWatchlist.toggle()

        let request = AddMovieToWatchlistRequest(
            mediaType: "movie",
            mediaId: movie?.id ?? 0,
            watchlist: isMovieInWatchlist
        )
                
        accountRepository.addMovieToWatchlist(
            accountId: ACCOUNT_ID,
            request: request
        )
        .sink { [weak self] (result: Result<AddMovieToWatchlistResponse, Error>) in
            switch result {
            case.success(let response):
                print("Watchlist: successfully added to watchlist, response: \(response)")
            case .failure(let error):
                print("tellWatchlist: error, \(error.localizedDescription)")
                self?.isMovieInWatchlist.toggle()
            }
        }
        .store(in: &movieDetailsCancellable)
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
        return getReleaseDate() + Constants.ASTERISK + getDurationTime() + Constants.ASTERISK + getMovieGenres()
    }
    
    func getAllSegmentOptions() -> [String] {
        return MovieDetailSegmentOptions.allCases.map { $0.rawValue }
    }
}
