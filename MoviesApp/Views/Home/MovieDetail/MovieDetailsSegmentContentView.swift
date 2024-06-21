//
//  MovieDetailsTabViewContent.swift
//  MoviesApp
//
//  Created by rescalon on 20/6/24.
//

import SwiftUI

/// ContainerView showing the details screen after tapping on the "Details" Segmented controller.
struct MovieDetailsTabViewContentView: View {
    
    let movie: Movie
    let durationTime: String
    let releaseDate: String
    let genres: String
    
    var body: some View {
        movieDetails(movie: movie)
    }
    
    /// View containing all details content,
    private func movieDetails(movie: Movie) -> some View {
        VStack(alignment: .leading) {
            Text(movie.title)
                .font(.title3)
                .padding(.top)
                .bold()
            
            Text(movie.overview)
                .font(.callout)
                .padding(.top, 4)
                .lineSpacing(5)
            
            detailFooter
        }
        .foregroundColor(Color.customColors.primaryClearTextColor)
    }
    
    private var detailFooter: some View {
        VStack(alignment: .leading, spacing: 16) {
            VerticalLabelWithTextView(label: "Duration:", text: durationTime)
            VerticalLabelWithTextView(label: "Release Date:", text: releaseDate)
            VerticalLabelWithTextView(label: "Genre:", text: genres)
        }
        .padding(.top)
    }
}

#Preview {
    MovieDetailsTabViewContentView(
        movie: PreviewDataProvider.instance.movie,
        durationTime: PreviewDataProvider.instance.movie.runtime?.formatRuntime() ?? "",
        releaseDate: PreviewDataProvider.instance.movie.releaseDate?.formatReleaseDate() ?? "",
        genres: "Action, Adventure, Romance, Comedy"
    )
    .padding()
}
