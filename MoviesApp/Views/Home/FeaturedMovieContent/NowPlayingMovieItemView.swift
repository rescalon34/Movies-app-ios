//
//  FeaturedMovieItemView.swift
//  MoviesApp
//
//  Created by rescalon on 29/6/24.
//

import SwiftUI

struct NowPlayingMovieItemView: View {
    
    // MARK: - Properties
    let title: String
    let imageUrl: String
    let releaseDate: String
    
    // MARK: - Body
    var body: some View {
        movieCardContent
    }
    
    // MARK: - Main content
    var movieCardContent: some View {
        VStack(spacing: 0) {
            loadAsyncImage(
                imageUrl: imageUrl.getImagePosterPath(),
                contentMode: .fill,
                width: .infinity,
                height: 140,
                placeholderBackground: Color.customColors.categoryCapsuleColor
            )
            movieInfoContent
                .padding(.vertical)
                .padding(.horizontal, 8)
        }
        .background(Color.customColors.categoryCapsuleColor)
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
    
    // MARK: - Views
    var movieInfoContent: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .lineLimit(1)
                .bold()
            
            Text(releaseDate)
                .font(.caption)
                .foregroundStyle(Color.customColors.primaryClearTextColor)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical)
    }
}

#Preview {
    let movie = PreviewDataProvider.instance.movies[2]
    return BaseScreenView {
        NowPlayingMovieItemView(
            title: movie.title,
            imageUrl: movie.imageUrl ?? "",
            releaseDate: "2023 | 2h 22m"
        )
    }
}
