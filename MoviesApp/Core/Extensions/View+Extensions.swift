//
//  View+Extensions.swift
//  MoviesApp
//
//  Created by rescalon on 11/6/24.
//

import Foundation
import SwiftUI

extension View {
    
    /// function to add a clear view at the top and bottom of ScrollView
    /// to add a fade effect while scrolling through items.
    func fadedScrollViewMask() -> some View {
        mask(
            LinearGradient(
                colors: [
                    .clear,
                    .primary,
                    .primary,
                    .clear,
                ],
                startPoint: .top, endPoint: .bottom
            )
        )
    }
    
    /// Load a regular resizable AsyncImage by providing imageUrl and size.
    func loadAsyncImage(
        imageUrl: String,
        width: CGFloat,
        height: CGFloat
    ) -> some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: width, height: height)
                .frame(maxWidth: width, maxHeight: height)
                .clipped()
        } placeholder: {
            Rectangle()
                .fill(Color.customColors.backgroundColor)
                .aspectRatio(contentMode: .fill)
                .frame(width: width, height: height)
                .clipped()
        }
    }
}
