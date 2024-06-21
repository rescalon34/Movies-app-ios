//
//  DotSeparatorView.swift
//  MoviesApp
//
//  Created by rescalon on 19/6/24.
//

import SwiftUI

/// Custom UIView Component to replace the `-` separator for a nice sized dot between the given Text.
struct TextWithDotSeparatorView: View {
    
    let text: String
    
    var body: some View {
        
        var attributedTextWithDotSeparator: AttributedString {
            var attributedText = AttributedString(text)
            let delimiterKey = "-"
            
            let attributedDot: AttributedString = {
                var unicodeDotText = AttributedString("  ●  ")
                unicodeDotText.font = .system(size: 7)
                unicodeDotText.foregroundColor = .white
                unicodeDotText.baselineOffset = 2
                return unicodeDotText
            }()
            
            while let range = attributedText.range(of: delimiterKey) {
                attributedText.replaceSubrange(range, with: attributedDot)
            }
            return attributedText
        }
        
        Text(attributedTextWithDotSeparator)
            .multilineTextAlignment(.center)
    }
}

#Preview {
    TextWithDotSeparatorView(text: "2024 - 1h 22m - Action, Adventure, Crime, Triller, Comedy")
}
