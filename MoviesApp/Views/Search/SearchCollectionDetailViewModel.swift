//
//  SearchCollectionDetailViewModel.swift
//  MoviesApp
//
//  Created by rescalon on 4/7/24.
//

import Foundation
import Combine

class SearchCollectionDetailViewModel: ObservableObject {
    
    // MARK: Networking properties
    private var searchRepository: SearchRepositoryProtocol
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - Published properties
    @Published var isLoading: Bool = false
    @Published var movies: [Movie] = []
    @Published var mainPosterImage: String = ""
    
    // MARK: - Animation properties
    @Published var showToolbarBackground = false
    @Published var mainLogoScale: CGFloat = 1.0
    @Published var mainLogoOpacity: CGFloat = 1.0
    @Published var toolbarLogoOpacity: CGFloat = 0.0
    @Published var logoPositionOffset: CGFloat = 0.0
    @Published var overlayOpacity: CGFloat = 0
    
    // MARK: - Initializer
    init(collection: Collection?, searchRepository: SearchRepositoryProtocol = SearchRepository(NetworkManager())) {
        self.searchRepository = searchRepository
        
        guard let collection = collection else { return }
        getCollectionDetails(collection: collection)
        getMainPosterImage(collection: collection)
    }
    
    // MARK: - Endpoint functions
    private func getCollectionDetails(collection: Collection) {
        isLoading = true
        searchRepository.getCollectionDetails(collectionId: collection.id)
            .sink { [weak self] (result: Result<CollectionResponse, Error>) in
                switch result {
                case .success(let collectionDetails):
                    self?.isLoading = false
                    self?.movies = collectionDetails.movies?.map { $0.toDomain() } ?? []
                    self?.getMainPosterImage(collection: collection)
                    print("tellCollection: collection details: \(String(describing: collectionDetails))")
                case .failure(let error):
                    self?.isLoading = false
                    print("error getting collection details: \(error)")
                }
            }
            .store(in: &cancellable)
    }
    
    // MARK: - View functions
    private func getMainPosterImage(collection: Collection) {
        if let backdropPath = collection.backdropPath, !backdropPath.isEmpty {
            mainPosterImage = backdropPath
        } else if let posterPath = collection.posterPath, !posterPath.isEmpty {
            mainPosterImage = posterPath
        } else {
            mainPosterImage = movies.first?.imageUrl ?? ""
        }
    }
}
