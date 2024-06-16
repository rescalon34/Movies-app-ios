//
//  HomeScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import SwiftUI

struct HomeScreenView: View {
    
    // MARK: - ViewModel
    @ObservedObject var viewModel: HomeViewModel = HomeViewModel()
    
    // MARK: - Properties
    @State var selectedCategory: String = "Comedy"
    @State var selectedMovie: Movie? = nil
    @State private var showCategoryToolbarItem = false
    @State private var contentOffset: CGFloat = 0
    @State private var isPresented = false
    
    // MARK: - Body
    var body: some View {
        BaseScreenView {
            ObservableScrollView(contentOffset: $contentOffset) {
                VStack {
                    homeAppBar
                    homeContent
                }
            }
            .onChange(of: contentOffset, perform: onCategoryToolbarItemVisibility)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar { homeToolbarContent }
            .fullScreenCover(isPresented: $isPresented) {
                MovieFilterFullScreenView(selectedCategory: $selectedCategory)
            }
            .navigationDestination(
                isPresented: Binding(
                    get: { selectedMovie != nil },
                    set: { isPresented in
                        // clear the selected movie value when navigation is dismissed.
                        if !isPresented {
                            selectedMovie = nil
                        }
                    }
                )
            ) {
                MovieDetailsScreenView(movie: selectedMovie)
            }
        }
    }
    
    // MARK: - Views
    var homeAppBar : some View {
        CategoryAppBarView(
            toolbarTitle: "Movies",
            selectedCategory: selectedCategory,
            onCategoryClick: {
                print("selected category: \(selectedCategory)")
                isPresented.toggle()
            }
        )
    }
    
    @ToolbarContentBuilder
    var homeToolbarContent: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            CategoryCapsuleView(
                selectedCategory: selectedCategory,
                onCategoryClick: {
                    print("selected category: \(selectedCategory)")
                    isPresented.toggle()
                }
            )
            .opacity(showCategoryToolbarItem ? 1 : 0)
        }
        ToolbarItem(placement: .topBarTrailing) {
            Button {
                // TODO
            } label: {
                Image(systemName: "tv.badge.wifi")
            }
        }
    }
    
    @ViewBuilder
    var homeContent: some View {
        if selectedCategory == "Featured" {
            FeaturedMoviesView(
                movies: viewModel.movies,
                onMovieClicked: onMovieClicked
            )
        } else {
            GridMoviesByCategoryView(
                category: selectedCategory,
                movies: viewModel.movies,
                onMovieClicked: onMovieClicked
            )
            .padding(.vertical)
        }
    }
    
    // MARK: - Functions
    /// if the offSet is lower than -30, then show the category toolbar item.
    private func onCategoryToolbarItemVisibility(value: CGFloat) {
        withAnimation {
            showCategoryToolbarItem = value < Constants.MIN_APPBAR_OFFSET
        }
    }
    
    /// Update the selectedMovie variable after tapping on it, so we can navigate
    /// to the Movie details screen and pass the selected movie item.
    private func onMovieClicked(movie: Movie) {
        print("selectedMovie: \(movie)")
        selectedMovie = movie
    }
}

// MARK: - Preview
#Preview {
    HomeScreenView(
        viewModel: HomeViewModel(),
        selectedCategory: "Comedy"
    )
}
