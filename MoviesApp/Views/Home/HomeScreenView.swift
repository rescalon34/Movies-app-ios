//
//  HomeScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import SwiftUI

struct HomeScreenView: View {
    
    // MARK: - ViewModel
    var viewModel: HomeViewModel = HomeViewModel()
    
    // MARK: - Properties
    @State var selectedCategory: String = "Comedy"
    @State private var showCategoryToolbarItem = false
    @State private var contentOffset: CGFloat = 0
    
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
        }
    }
    
    // MARK: - Views
    var homeAppBar : some View {
        CategoryAppBarView(
            toolbarTitle: "Movies",
            selectedCategory: selectedCategory,
            onCategoryClick: { category in
                print("clicked category: \(category)")
                withAnimation(.smooth) {
                    selectedCategory = category
                }
            }
        )
    }
    
    @ToolbarContentBuilder
    var homeToolbarContent: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            CategoryCapsuleView(
                selectedCategory: selectedCategory,
                onCategoryClick: { category in
                    print("clicked category: \(category)")
                    withAnimation(.smooth) {
                        selectedCategory = category
                    }
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
            FeaturedMoviesView(movies: viewModel.movies)
        } else {
            GridMoviesByCategoryView(
                category: selectedCategory,
                movies: viewModel.movies
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
}

// MARK: - Preview
#Preview {
    NavigationStack {
        HomeScreenView(
            viewModel: HomeViewModel(),
            selectedCategory: "Comedy"
        )
    }
}
