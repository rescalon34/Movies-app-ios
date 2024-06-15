//
//  CircleProvileView.swift
//  MoviesApp
//
//  Created by rescalon on 12/6/24.
//

import SwiftUI

/// Reusable Circular Image with blur and gradient colors around the profile image item.
struct CircularGradientProfileView: View {
    
    // MARK: - Properties
    let imageUrl : String
    let size: CGSize
    var strokeWidth: CGFloat = Constants.FIVE
    let isSelected: Bool
    
    // MARK: - Body
    var body: some View {
        ZStack {
            stroke.opacity(isSelected ? 1 : 0)
            gradientContent
            loadAsyncImage(
                imageUrl: imageUrl,
                width: size.width,
                height: size.height
            )
            .clipShape(Circle())
        }
    }
    
    // MARK: - Views
    private var stroke: some View {
        Circle()
            .frame(
                width: size.width + strokeWidth,
                height: size.height + strokeWidth
            )
    }
    
    private var gradientContent: some View {
        LinearGradient(colors: [.yellow.opacity(0.7), .orange.opacity(0.7), .black.opacity(0.7)], startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: size.width, height: size.height)
            .blur(radius: Constants.THREE)
            .clipShape(Circle())
    }
}

#Preview {
    BaseScreenView {
        CircularGradientProfileView(
            imageUrl: PreviewDataProvider.instance.profileImage,
            size: CGSize(width: 80, height: 80),
            isSelected: true
        )
    }
}
