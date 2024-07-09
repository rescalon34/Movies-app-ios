//
//  SearchViewModel.swift
//  MoviesApp
//
//  Created by rescalon on 3/7/24.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    // MARK: Networking properties
    private var searchRepository: SearchRepositoryProtocol
    private var cancellable = Set<AnyCancellable>()
    
    // MARK: - Published properties
    @Published var isLoading: Bool = false
    @Published var trendingMovies: [Movie] = []
    @Published var moviesByKeyword: [Movie] = []
    @Published var collections: [Collection] = []
    @Published var searchSuggestions: [String] = []
    @Published var collectionTitle: String = ""
    @Published var mainCollectionLogo: String = ""
    @Published var searchKeyword: String = ""
    @Published var searchResultStatus: SearchResultStatus = .NOT_STARTED
    
    // MARK: - Initializer
    init(searchRepository: SearchRepositoryProtocol = SearchRepository(NetworkManager())) {
        self.searchRepository = searchRepository
        
        getTrendingMovies()
        getSuggestions()
        getCollections(keyword: CollectionKeywords.getRandomKeyword())
        setupBindings()
    }
    
    private func setupBindings() {
        onSearchKeywordChanges()
    }
    
    // MARK: - Endpoint functions
    private func getTrendingMovies() {
        isLoading = true
        searchRepository.getTrendingMovies(timeWindow: TimeWindowFilter.day.rawValue)
            .sink { [weak self] (result: Result<MovieDataResponse, Error>) in
                switch result {
                case .success(let trendingMovies):
                    self?.isLoading = false
                    self?.trendingMovies = trendingMovies.results.map { $0.toDomain() }
                case .failure(let error):
                    self?.isLoading = false
                    print("error getting trending movies: \(error)")
                }
            }
            .store(in: &cancellable)
    }
    
    func getSuggestions() {
        // TODO, should come from an API
        searchSuggestions = PreviewDataProvider.instance.movies.map { $0.title }
    }
    
    private func getCollections(keyword: String) {
        isLoading = true
        searchRepository.getCollection(keyword: keyword)
            .sink { [weak self] (result: Result<CollectionDataResponse, Error>) in
                switch result {
                case .success(let collection):
                    self?.isLoading = false
                    self?.collections = collection.results?.map { $0.toDomain() } ?? []
                    self?.collectionTitle = keyword
                    self?.mainCollectionLogo = CollectionKeywords.getLogoByCollection(collectionName: keyword)
                    print("tellCollection: collection: \(String(describing: collection.results))")
                case .failure(let error):
                    self?.isLoading = false
                    print("error getting collection: \(error)")
                }
            }
            .store(in: &cancellable)
    }
    
    private func fetchMovieByKeyword(keyword: String) {
        isLoading = true
        searchRepository.searchMovie(keyword: keyword)
            .sink { [weak self] (result: Result<MovieDataResponse, Error>) in
                switch result {
                case .success(let movies):
                    self?.isLoading = false
                    self?.onFetchMovieByKeyword(keyword: keyword, response: movies)
                    print("tellSearch: movies by keyword: \(String(describing: movies.results))")
                case .failure(let error):
                    self?.isLoading = false
                    print("error getting movies by keyword: \(error)")
                }
            }
            .store(in: &cancellable)
    }
    
    // MARK: - View functions
    func getCollectionsTitle() -> String {
        let title = collectionTitle == "Collections" ? "Collections" : "Collections * \(collectionTitle)"
        return title
    }
    
    /// Observe changes from searchKeyword variable whenever the user is typing on the search keyword
    /// debounce for half second before making the API request based on the typed keyword.
    func onSearchKeywordChanges() {
        $searchKeyword
            .debounce(for: .milliseconds(Constants.HALF_SECOND), scheduler: DispatchQueue.main)
            .removeDuplicates()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] keyword in
                guard !keyword.isEmpty else {
                    self?.moviesByKeyword = []
                    self?.searchResultStatus = .NOT_STARTED
                    return
                }
                print("tellMeSearch: search by this keyword: \(keyword)")
                self?.fetchMovieByKeyword(keyword: keyword)
            }
            .store(in: &cancellable)
    }
    
    private func onFetchMovieByKeyword(keyword: String, response: MovieDataResponse) {
        self.moviesByKeyword = response.results.map { $0.toDomain() }
        
        // update search result status
        if moviesByKeyword.isEmpty {
            searchResultStatus = .NO_RESULT
        }
    }
}
