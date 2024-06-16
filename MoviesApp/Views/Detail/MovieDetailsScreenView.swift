//
//  MovieDetailsScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 14/6/24.
//

import SwiftUI

struct MovieDetailsScreenView: View {
    
    let movie: Movie?
    
    var body: some View {
        BaseScreenView {
            Text("Movie: \(movie?.title ?? "")")
        }
    }
}

#Preview {
    MovieDetailsScreenView(movie: PreviewDataProvider.instance.movie)
}
