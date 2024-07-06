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
    
    func fadedBottomViewMask(
        repeating: Int = Int(Constants.THREE),
        startPoint: UnitPoint = .top,
        endPoint: UnitPoint = .bottom
    ) -> some View {
        mask(
            LinearGradient(
                colors: [
                    .clear,
                    .primary,
                    .primary,
                    .primary,
                ],
                startPoint: startPoint, endPoint: endPoint
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
        height: CGFloat = .infinity,
        placeholderBackground: Color = Color.customColors.backgroundColor
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
                .fill(placeholderBackground)
                .aspectRatio(aspectRatio, contentMode: .fill)
                .frame(width: width, height: height)
                .clipped()
        }
    }
    
    /// This function creates a flexible GridItem list based on the given columns number.
    /// - Param columns: the number of columns that the LazyVGrid will display.
    /// - hSpacing: the horizontal space between each flexible grid items.
    ///
    func getFlexibleGridColumns(_ columns: Int, _ hSpacing: CGFloat) -> [GridItem] {
        return Array(repeatElement(GridItem(.flexible(), spacing: hSpacing), count: columns))
    }
    
    /// represents the horizontal and vertical spaces of a LazyVGrid
    typealias LazyVGridSpacing = (horizontal: CGFloat, vertical: CGFloat)
    
    /// Scale up gradually
    /// - Param absoluteValue: the given value collected from the scrollView Reader.
    ///
    func scaleUp(_ absoluteValue: CGFloat, _ increasingValue: CGFloat) -> CGFloat {
        return max(0.5, 1.0 - (abs(absoluteValue + increasingValue) / increasingValue))
    }
    
    /// Gradually increase opacity
    /// - Param absoluteValue: the given value collected from the scrollView Reader.
    ///
    func increaseOpacity(_ absoluteValue: CGFloat, _ increasingValue: CGFloat, _ minOpacity: CGFloat = 1.0) -> CGFloat {
        return min(minOpacity, (abs(absoluteValue + increasingValue) / increasingValue))
    }
    
    /// Gradually decrease opacity
    /// - Param absoluteValue: the given value collected from the scrollView Reader.
    /// 
    func decreaseOpacity(_ absoluteValue: CGFloat, _ decreasingValue: CGFloat) -> CGFloat {
        return max(0.0, 1.0 - (abs(absoluteValue + decreasingValue) / decreasingValue))
    }
}
