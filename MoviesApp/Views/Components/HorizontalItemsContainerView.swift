//
//  HorizontalItemsContainerView.swift
//  MoviesApp
//
//  Created by rescalon on 7/6/24.
//

import SwiftUI


/// This view is inteneded to be reused on those screen that display scrollable
/// items horizontally within a given category.
struct HorizontalItemsContainerView: View {
    
    // MARK: - Properties
    let title: String
    let items: [Movie]
    let onMovieClicked: (Movie) -> ()
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .bold()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(items) { item in
                        MovieItemView(imageUrl: item.imageUrl)
                            .onTapGesture {
                                onMovieClicked(item)
                            }
                    }
                }
            }
        }
    }
}

#Preview {
    HorizontalItemsContainerView(
        title: "Featured",
        items: PreviewDataProvider.instance.movies) { Movie in
            
        }
}