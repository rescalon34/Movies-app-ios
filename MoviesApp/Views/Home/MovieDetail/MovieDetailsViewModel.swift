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
    
    init(moviesRepository: MoviesRepositoryProtocol = MoviesRepository(NetworkManager())) {
        self.moviesRepository = moviesRepository
        self.movie = movie
    }
    
    func getMovieDetails(movieId: Int) {
        isLoading = true
        moviesRepository.getMovieDetails(movieId: movieId)
            .sink { [weak self] (result: Result<MovieDetailResponse, Error>) in
                switch result {
                case .success(let movieDetails):
                    // TODO: Remove this async, adding it now just to see the loading view.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                        self?.movie = movieDetails.toDomain()
                        self?.isLoading = false
                    }
                    print("Movie details: \(movieDetails)")
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    print("errror getting movie details: \(error.localizedDescription)")
                    self?.isLoading = false
                }
            }
            .store(in: &cancellable)
    }
    
    func getMovieTitle() -> String {
        return movie?.title ?? ""
    }
    
    func getOfficialTrailerVideoKey() -> String {
        return movie?.videos?.first(where: { video in
            video.type == VideoType.Trailer.rawValue
        })?.key ?? ""
    }
}
