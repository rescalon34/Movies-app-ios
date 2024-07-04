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
    private var mainSearchContent: some View {
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
        .padding(.bottom, 50)
        .scrollIndicators(.hidden)
    }
    
    private var trendingMoviesHorizontalViewContent: some View {
        ScrollView(showsIndicators: false) {
            HorizontalItemsContainerView(
                title: "Trending Movies",
                items: viewModel.trendingMovies,
                onMovieClicked: { movie in
                    
                }
            )
        }
    }
    
    private var collectionsContent: some View {
        VStack(alignment: .leading) {
            Text("Collections")
                .font(.subheadline)
                .foregroundStyle(Color.customColors.secondaryTextColor)
                .bold()
            
            gridCollectionsContent
        }
        .padding()
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
            }
        }
    }
}

// MARK: - Preview
#Preview {
    SearchScreenView(screenTitle: "")
}
