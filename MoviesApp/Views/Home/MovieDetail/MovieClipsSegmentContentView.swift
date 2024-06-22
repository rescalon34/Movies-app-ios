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
    
    // MARK: - Body
    var body: some View {
        videoClipsContent
    }
    
    // MARK: Views
    @ViewBuilder
    private var videoClipsContent: some View {
        if let videos = videos, !videos.isEmpty {
            ForEach(videos) { video in
                VideoPreviewItemView(
                    imageUrl: video.key.getYoutubeVideoPreviewUrl(),
                    title: video.name,
                    overview: getVideoOverview(video: video)
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
        
        let overview = publishedAt + DASH + type + DASH + countryCode + DASH + language
        return overview
    }
}

// MARK: Preview
#Preview {
    MovieClipsSegmentContentView(videos: PreviewDataProvider.instance.movie.videos ?? [])
}
