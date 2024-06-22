//
//  View+Extensions.swift
//  MoviesApp
//
//  Created by rescalon on 11/6/24.
//

import Foundation
import SwiftUI

extension View {
    
    /// A View modifier that applies a translucent effect while scrolling through items.
    ///
    /// This function creates a mask effect of an `opaque scrolled item at the top and bottom`
    /// of the ScrollView while vertically scrolling items.
    ///
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
    
    @ViewBuilder
    func showToolbarBackground(isVisible: Bool) -> some View {
        toolbarBackground(isVisible ? .visible : .hidden, for: .navigationBar)
    }
    
    /// A View modifier that applies a translucent gradient mask to a view.
    ///
    /// This function creates a mask using a linear gradient with a list of black
    /// colors and a clear color at the end providing a translucent effect.
    ///
    /// - Parameters:
    ///   - repeating: The number of times the black color should be repeated in the gradient.
    ///     Default value is `3`.
    ///   - startPoint: The starting point of the gradient. Default value is `.top`.
    ///   - endPoint: The ending point of the gradient. Default value is `.bottom`.
    ///
    func translucentGradientMask(
        repeating: Int = Int(Constants.THREE),
        startPoint: UnitPoint = .top,
        endPoint: UnitPoint = .bottom
    ) -> some View {
        let blackColors = Array(repeating: Color.black, count: repeating)
        let gradientColors = blackColors + [Color.clear]
        
        return mask(
            LinearGradient(
                gradient: Gradient(colors: gradientColors),
                startPoint: startPoint, endPoint: endPoint
            )
        )
    }
    
    /// Load a regular resizable AsyncImage by providing imageUrl and size.
    func loadAsyncImage(
        imageUrl: String,
        aspectRatio: CGFloat? = nil,
        contentMode: ContentMode = .fit,
        width: CGFloat = .infinity,
        height: CGFloat = .infinity
    ) -> some View {
        AsyncImage(url: URL(string: imageUrl)) { image in
            image
                .resizable()
                .scaledToFill()
                .aspectRatio(aspectRatio, contentMode: contentMode)
                .frame(width: width, height: height)
                .frame(maxWidth: width, maxHeight: height)
                .clipped()
        } placeholder: {
            Rectangle()
                .fill(Color.customColors.backgroundColor)
                .aspectRatio(aspectRatio, contentMode: .fill)
                .frame(width: width, height: height)
                .clipped()
        }
    }
}
