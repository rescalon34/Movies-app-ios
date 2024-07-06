//
//  ContentNotAvailableView.swift
//  MoviesApp
//
//  Created by rescalon on 5/7/24.
//

import SwiftUI

struct ContentNotAvailableView: View {
    
    let title: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text("Content not available")
                .font(.callout)
                .bold()
            Text("There is no \(title) content currently available. Plsase check back soon.")
                .font(.footnote)
                .foregroundStyle(Color.customColors.primaryClearTextColor)
                .multilineTextAlignment(.center)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ContentNotAvailableView(title: "Inside Out")
}
