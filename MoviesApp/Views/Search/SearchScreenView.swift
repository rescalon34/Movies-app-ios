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
    
    // MARK: - Properties
    let screenTitle: String
    @State var searchKeyword: String = ""
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            BaseScreenView {
                VStack {
                    mainSearchContent
                }
            }
            .searchable(text: $searchKeyword)
            .navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
            
        }
        .background(Color.blue)
        .tint(.blue)
    }
    
    // MARK: - Views
    var mainSearchContent: some View {
        ScrollView {
            VStack {
                trendingMoviesHorizontalViewContent
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        // this padding `> 1` will avoid the scrollable content appear behind the translucient toolbar
        // and it will keep pinned the `searchable` modifier.
        .padding(.top, 1)
    }
    
    var trendingMoviesHorizontalViewContent: some View {
        ScrollView(showsIndicators: false) {
            HorizontalItemsContainerView(
                title: "Trending Movies",
                items: viewModel.trendingMovies,
                onMovieClicked: { movie in
                    
                }
            )
        }
    }
}

// MARK: - Preview
#Preview {
    SearchScreenView(screenTitle: "")
}
