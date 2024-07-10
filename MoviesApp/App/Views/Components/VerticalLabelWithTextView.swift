//
//  VerticalLabelWithTextView.swift
//  MoviesApp
//
//  Created by rescalon on 20/6/24.
//

import SwiftUI

struct VerticalLabelWithTextView: View {
    
    let label: String
    let text: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(label)
                .foregroundStyle(Color.customColors.primaryClearTextColor.opacity(0.9))
            Text(text)
                .foregroundStyle(Color.customColors.primaryTextColor)
        }
        .font(.subheadline)
    }
}

#Preview {
    VerticalLabelWithTextView(label: "Duration:", text: "2h 1m")
}
