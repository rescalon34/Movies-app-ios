//
//  MovieClipsSegmentContentView.swift
//  MoviesApp
//
//  Created by rescalon on 20/6/24.
//

import SwiftUI

struct MovieClipsSegmentContentView: View {
    
    // MARK: - Properties
    let videos: [Video]?
    let onItemClick: (Video) -> ()
    
    // MARK: - Body
    var body: some View {
        videoClipsContent
    }
    
    // MARK: Views
    @ViewBuilder
    private var videoClipsContent: some View {
        if let videos = videos, !videos.isEmpty {
            ForEach(videos) { video in
                MoviePreviewItemView(
                    imageUrl: video.key.getYoutubeVideoPreviewUrl(),
                    title: video.name,
                    overview: getVideoOverview(video: video),
                    onItemClick: { onItemClick(video) }
                )
            }
        }
    }
    
    // MARK: Functions
    private func getVideoOverview(video: Video) -> String {
        let publishedAt = video.publishedAt.formatPublishedAtDate()
        let type = video.type
        let countryCode = video.countryCode
        let language = video.language
        
        let delimiterKey = Constants.ASTERISK
        
        let overview = publishedAt + delimiterKey + type + delimiterKey + language + DASH + countryCode
        return overview
    }
}

// MARK: Preview
#Preview {
    MovieClipsSegmentContentView(
        videos: PreviewDataProvider.instance.movie.videos ?? [],
        onItemClick: { _ in }
    )
}
