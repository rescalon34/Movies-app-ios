//
//  WatchlistScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 30/6/24.
//

import SwiftUI

struct WatchlistMovieScreenView: View {
    
    // MARK: - ViewModel
    @StateObject var viewModel: WatchlistMovieViewModel = .init()
    
    // MARK: - Properties
    @State var selectedMovie: Movie? = nil
    @State var contentOffset: CGFloat = 0
    @State private var showPrincipalToolbarItem = false
    
    // MARK: Body
    var body: some View {
        NavigationStack {
            BaseScreenView {
                ObservableScrollView(contentOffset: $contentOffset) {
                    VStack(alignment: .leading) {
                        watchlistAppBar
                        watchlistMoviesContent
                            .padding(.horizontal)
                    }
                    .onChange(of: contentOffset, perform: onPrincipalToolbarItemVisibility)
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar { watchlistToolbarContent }
                    .navigationDestination(isPresented: $selectedMovie.toBinding()) {
                        MovieDetailsScreenView(movieId: selectedMovie?.id, isAddedToWatchlist: true)
                    }
                }
            }
        }
    }
    
    // MARK: - AppBar / Toolbar
    var watchlistAppBar : some View {
        CategoryAppBarView(
            toolbarTitle: "Watchlist",
            selectedCategory: "First Added",
            onCategoryClick: {
                // TODO:
                //isPresented.toggle()
            }
        )
    }
    
    @ToolbarContentBuilder
    var watchlistToolbarContent: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            CategoryCapsuleView(
                selectedCategory: "Last Added",
                onCategoryClick: {
                    // TODO: 
                    //isPresented.toggle()
                }
            )
            .opacity(showPrincipalToolbarItem ? 1 : 0)
        }
        
    }
    
    // MARK: - Views
    @ViewBuilder
    var watchlistMoviesContent: some View {
        Text("My movies")
            .font(.subheadline)
            .foregroundStyle(Color.customColors.secondaryTextColor)
            .bold()
        
        LazyVGridMoviesView(
            movies: viewModel.movies,
            movieItemSize: CGSize(width: 110, height: 250),
            imageResolution: W500_POSTER_WIDTH,
            lazyVGridColumns: Int(Constants.TWO),
            lazyVGridSpacing: (Constants.TEN, Constants.TEN),
            onMovieClicked: { movie in
                selectedMovie = movie
            }
        )
    }
    
    // MARK: Functions
    private func onPrincipalToolbarItemVisibility(value: CGFloat) {
        withAnimation {
            showPrincipalToolbarItem = value < Constants.MIN_APPBAR_OFFSET
        }
    }
}

// MARK: - Preview
#Preview {
    WatchlistMovieScreenView(viewModel: WatchlistMovieViewModel())
}
