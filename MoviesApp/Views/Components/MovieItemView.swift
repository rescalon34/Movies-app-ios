//
//  MovieItemView.swift
//  MoviesApp
//
//  Created by rescalon on 7/6/24.
//

import SwiftUI

struct MovieItemView: View {
    
    // MARK: - Properties
    let imageUrl: String?
    var movieItemSize: CGSize = CGSize(width: 110, height: 160)
    
    // MARK: Body
    var body: some View {
        imageContainer
    }
    
    // MARK: - Views
    var imageContainer : some View {
        VStack {
            AsyncImage(url: URL(string: imageUrl?.getImagePosterPath() ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(minWidth: movieItemSize.width, maxWidth: .infinity, minHeight: movieItemSize.height, maxHeight: movieItemSize.height)
                    .clipped()
                    .cornerRadius(8)
                
            } placeholder: {
                Rectangle()
                    .fill(Color.customColors.backgroundColor)
                    .frame(minWidth: movieItemSize.width, maxWidth: .infinity, minHeight: movieItemSize.height, maxHeight: movieItemSize.height)
                    .clipped()
                    .cornerRadius(8)
            }
        }
    }
}

#Preview {
    MovieItemView(imageUrl: PreviewDataProvider.instance.movie.imageUrl ?? "")
}
