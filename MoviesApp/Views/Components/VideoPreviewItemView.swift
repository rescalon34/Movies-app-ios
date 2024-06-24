//
//  VideoItemView.swift
//  MoviesApp
//
//  Created by rescalon on 21/6/24.
//

import SwiftUI

/// Reusable VideoPreview Cell, it receives an image, title and overview as string values.
/// - Parameter onItemClick: a callback closure to be invoked whenever a video thumbnail gets clicked.
///
struct VideoPreviewItemView: View {
    
    // MARK: - Properties
    let imageUrl: String
    let title: String
    let overview: String
    let onItemClick: () -> ()
    
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
                .overlay(alignment: .bottomLeading) {
                    playOverlayIcon
                }
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .onTapGesture {
                    onItemClick()
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(title)
                        .font(.subheadline)
                        .lineLimit(Int(Constants.TWO))
                        .bold()
                    
                    TextWithDotSeparatorView(text: overview)
                        .foregroundStyle(Color.customColors.primaryClearTextColor)
                        .font(.caption2)
                        .lineLimit(Int(Constants.TWO))
                        .padding(.trailing)
                        .multilineTextAlignment(.leading)
                }
                Spacer()
            }
        }
        .padding(.bottom, 5)
    }
    
    private var playOverlayIcon: some View {
        Image(systemName: "play.fill")
            .font(.caption)
            .padding()
            .background(
                Circle()
                    .fill(Color.black.opacity(0.8))
                    .frame(width: 26)
            )
    }
}

// MARK: - Preview
#Preview {
    let video = PreviewDataProvider.instance.movie.videos?.first
    let imageUrl = video?.key.getYoutubeVideoPreviewUrl() ?? ""
    let overview = "Wednesday, June 19, 2024*Teaser*en-US"
    
    return VideoPreviewItemView(
        imageUrl: imageUrl,
        title: "Inside Out",
        overview: overview,
        onItemClick: { }
    )
}
