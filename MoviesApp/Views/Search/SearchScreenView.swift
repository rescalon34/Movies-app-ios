//
//  SearchScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 13/6/24.
//

import SwiftUI

struct SearchScreenView: View {
    
    // MARK: - ViewModel
    @StateObject var viewModel: SearchViewModel = .init()
    @FocusState private var isSearchFieldFocused: Bool
    
    // MARK: - Properties
    let screenTitle: String
    @State var selectedMovie: Movie? = nil
    @State var selectedCollection: Collection? = nil
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            BaseScreenView(isLoading: viewModel.isLoading) {
                searchScreenContent
            }
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            .navigationDestination(isPresented: $selectedMovie.toBinding()) {
                MovieDetailsScreenView(movieId: selectedMovie?.id, isAddedToWatchlist: .constant(false))
            }
            .navigationDestination(isPresented: $selectedCollection.toBinding()) {
                SearchCollectionDetailView(
                    collection: selectedCollection,
                    mainLogoUrl: viewModel.mainCollectionLogo
                )
            }
        }
        .searchable(text: $viewModel.searchKeyword)
        .focused($isSearchFieldFocused)
    }
    
    // MARK: - Views
    private var searchScreenContent: some View {
        VStack {
            if showSearchByKeywordsView() {
                SearchByKeywordResultsView(
                    keyword: viewModel.searchKeyword,
                    moviesByKeyword: viewModel.moviesByKeyword,
                    searchResultStatus: viewModel.searchResultStatus,
                    searchSuggestions: viewModel.searchSuggestions,
                    onItemClick: { movie in
                        selectedMovie = movie
                    },
                    onSuggestionClick: { suggestion in
                        viewModel.searchKeyword = suggestion
                    }
                )
            } else {
                trendingAndCollectionsContent
            }
        }
    }
    
    private var trendingAndCollectionsContent: some View {
        ScrollView {
            VStack(alignment: .leading) {
                trendingMoviesHorizontalViewContent
                collectionsContent
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        // this padding `> 1` will avoid the scrollable content appear behind the translucient toolbar
        // and it will keep pinned the `searchable` modifier.
        .padding(.top, 1)
        .scrollIndicators(.hidden)
    }
    
    private var trendingMoviesHorizontalViewContent: some View {
        ScrollView(showsIndicators: false) {
            HorizontalItemsContainerView(
                title: "Trending Movies",
                items: viewModel.trendingMovies,
                onMovieClicked: { movie in
                    selectedMovie = movie
                }
            )
        }
    }
    
    @ViewBuilder
    private var collectionsContent: some View {
        VStack(alignment: .leading) {
            TextWithDotSeparatorView(text: viewModel.getCollectionsTitle())
                .font(.subheadline)
                .foregroundStyle(Color.customColors.secondaryTextColor)
                .bold()
            
            gridCollectionsContent
        }
        .padding()
        .padding(.bottom, 50)
    }
    
    private var gridCollectionsContent: some View {
        LazyVGrid(
            columns: getFlexibleGridColumns(Int(Constants.THREE), Constants.TEN),
            spacing: Constants.TEN
        ) {
            ForEach(viewModel.collections) { collection in
                MovieItemView(
                    imageUrl: collection.posterPath?.getImagePosterPath() ?? ""
                )
                .onTapGesture {
                    selectedCollection = collection
                }
            }
        }
    }
    
    // MARK: - Functions
    func showSearchByKeywordsView() -> Bool {
        isSearchFieldFocused || !viewModel.searchKeyword.isEmpty
    }
}

// MARK: - Preview
#Preview {
    BaseScreenView {
        SearchScreenView(screenTitle: "")
    }
}
