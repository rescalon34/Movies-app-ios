//
//  VideoItemView.swift
//  MoviesApp
//
//  Created by rescalon on 21/6/24.
//

import SwiftUI

/// Reusable VideoPreview Cell, it receives an image, title and overview as string values.
/// 
struct VideoPreviewItemView: View {
    
    // MARK: - Properties
    let imageUrl: String
    let title: String
    let overview: String
    
    // MARK: - Body
    var body: some View {
        videoItem
    }
    
    // MARK: Views
    private var videoItem: some View {
        VStack(alignment: .leading) {
            HStack() {
                loadAsyncImage(
                    imageUrl: imageUrl,
                    aspectRatio: 2.5,
                    contentMode: .fill,
                    width: 125,
                    height: 70
                )
                .clipShape(RoundedRectangle(cornerRadius: 8))
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.subheadline)
                        .lineLimit(1)
                        .bold()
                    
                    TextWithDotSeparatorView(text: overview)
                        .foregroundStyle(Color.customColors.primaryClearTextColor)
                        .font(.caption2)
                        .lineLimit(2)
                        .padding(.trailing)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
            }
        }
        .padding(.bottom, 5)
    }
}

// MARK: - Preview
#Preview {
    let imageUrl = "L4DrolmDxmw".getYoutubeVideoPreviewUrl()
    let overview = "Wednesday, June 19, 2024-Teaser-US-en"
    
    return VideoPreviewItemView(
        imageUrl: imageUrl,
        title: "Inside Out",
        overview: overview
    )
}
