//
//  ContentNotAvailableView.swift
//  MoviesApp
//
//  Created by rescalon on 5/7/24.
//

import SwiftUI

struct ContentNotAvailableView: View {
    
    let title: String?
    let description: String?
    
    init(title: String? = nil, description: String? = nil) {
        self.title = title
        self.description = description
    }
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title ?? "Content not available")
                .font(.callout)
                .multilineTextAlignment(.center)
                .bold()
            Text(description ?? "This content is not yet available. Please check back soon")
                .font(.footnote)
                .foregroundStyle(Color.customColors.primaryClearTextColor)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentNotAvailableView(title: nil, description: nil)
}
