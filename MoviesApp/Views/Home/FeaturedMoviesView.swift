//
//  FeaturedMoviesView.swift
//  MoviesApp
//
//  Created by rescalon on 7/6/24.
//

import SwiftUI

/**
 Featured movies screen content.
 */
struct FeaturedMoviesView: View {
    
    // MARK: - Properties
    let movies: [Movie]
    
    // MARK: - Body
    var body: some View {
        featuredMoviesContent
    }
    
    // MARK: - Views
    var featuredMoviesContent: some View {
        List {
            // TODO, should be iterated by category.
            HorizontalItemsContainerView(title: "Recently Added", items: movies)
            HorizontalItemsContainerView(title: "Comedy", items: movies)
            HorizontalItemsContainerView(title: "Action and Adventure", items: movies)
            HorizontalItemsContainerView(title: "Sport", items: movies)
            HorizontalItemsContainerView(title: "Horror", items: movies)
            HorizontalItemsContainerView(title: "Drama", items: movies)
        }
        .listStyle(.inset)
        .background(Color.customColors.backgroundColor)
        .listStyle(.inset)
    }
}

#Preview {
    FeaturedMoviesView(movies: PreviewDataProvider.instance.movies)
}
