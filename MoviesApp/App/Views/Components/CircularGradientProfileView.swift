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
    let colors: [Color]?
    
    // MARK: - Body
    var body: some View {
        ZStack {
            stroke.opacity(isSelected ? 1 : 0)
            gradientContent
            circleImageContent
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
    
    @ViewBuilder
    private var gradientContent: some View {
        if let colors {
            LinearGradient(colors: colors.map { $0.opacity(0.7) }, startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: size.width, height: size.height)
                .blur(radius: Constants.THREE)
                .clipShape(Circle())
        }
    }
    
    @ViewBuilder
    private var circleImageContent: some View {
        if !imageUrl.isEmpty {
            loadAsyncImage(
                imageUrl: imageUrl,
                width: size.width,
                height: size.height
            )
            .clipShape(Circle())
        } else {
            Circle()
                .fill(Color.customColors.dismissViewIconColor)
                .frame(width: size.width, height: size.height)
                .overlay {
                    CircleIconView(iconName: "xmark")
                        .rotationEffect(.degrees(45))
                }
        }
    }
}

#Preview {
    BaseScreenView {
        CircularGradientProfileView(
            imageUrl: PreviewDataProvider.instance.profiles[1].imageUrl,
            size: CGSize(width: 80, height: 80),
            isSelected: false,
            colors: PreviewDataProvider.instance.profiles[1].colors
        )
    }
}
