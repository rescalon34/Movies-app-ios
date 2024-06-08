//
//  HomeScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import SwiftUI

struct HomeScreenView: View {
    
    // MARK: - Properties
    @State var selectedCategory: String = "Comedy"
    var viewModel: HomeViewModel = HomeViewModel()
    
    // MARK: - Body
    var body: some View {
        BaseScreenView {
            VStack {
                homeToolbar
                
                // TODO, show a different UI when other category gets selected.
                FeaturedMoviesView(movies: viewModel.movies)
            }
        }
    }
    
    // MARK: - Views
    var homeToolbar : some View {
        CategoryToolbarView(
            toolbarTitle: "Movies",
            selectedCategory: selectedCategory,
            onCategoryClick: { category in
                print("clicked category: \(category)")
                withAnimation(.spring) {
                    selectedCategory = category
                }
            }
        )
        .toolbar {
            ToolbarItem {
                Button {
                    // TODO
                } label: {
                    Image(systemName: "tv.badge.wifi")
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HomeScreenView(
            selectedCategory: "Comedy",
            viewModel: HomeViewModel()
        )
    }
}
