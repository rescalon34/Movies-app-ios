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
    @Published var showToolbarBackground = false
    @Published var mainLogoScale: CGFloat = 1.0
    @Published var mainLogoOpacity: CGFloat = 1.0
    @Published var toolbarLogoOpacity: CGFloat = 0.0
    
    // MARK: - Initializer
    init(searchRepository: SearchRepositoryProtocol = SearchRepository(NetworkManager())) {
        self.searchRepository = searchRepository
    }
}
