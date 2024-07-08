//
//  SearchByKeywordResultsView.swift
//  MoviesApp
//
//  Created by rescalon on 6/7/24.
//

import SwiftUI

struct SearchByKeywordResultsView: View {
    
    // MARK: - Properties
    let moviesByKeyword: [Movie]
    let searchResultStatus: SearchResultStatus
    
    // MARK: - Body
    var body: some View {
        BaseScreenView {
            VStack(alignment: .leading) {
                if !moviesByKeyword.isEmpty {
                    moviesContent
                } else {
                    if searchResultStatus == .NOT_STARTED {
                        Text("Search for any movie!")
                    } else {
                        ContentNotAvailableView(title: "test")
                    }
                }
            }
        }
    }
    
    // MARK: - main screen content
    @ViewBuilder
    private var moviesContent: some View {
        Text("Results")
            .font(.subheadline)
            .foregroundStyle(Color.customColors.secondaryTextColor)
            .bold()
            .padding(.horizontal)
        
        ScrollView {
            ForEach(moviesByKeyword) { movie in
                MoviePreviewItemView(
                    imageUrl: movie.imageUrl?.getImagePosterPath() ?? "",
                    title: movie.title,
                    overview: getOverview(movie: movie),
                    isVideoPreview: false,
                    onItemClick: {  }
                )
            }
        }
    }
    
    // MARK: Functions
    private func getOverview(movie: Movie) -> String {
        let releasedOn = movie.releaseDate?.formatReleaseDate() ?? ""
        let language = movie.originalLanguage?.uppercased() ?? ""
        let delimiterKey = Constants.ASTERISK
        
        return language + delimiterKey + releasedOn
    }
}

// MARK: - Preview
#Preview {
    SearchByKeywordResultsView(
        moviesByKeyword: PreviewDataProvider.instance.movies,
        searchResultStatus: .NOT_STARTED
    )
}
