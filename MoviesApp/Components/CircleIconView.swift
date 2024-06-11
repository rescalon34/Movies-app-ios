//
//  CircleIconView.swift
//  MoviesApp
//
//  Created by rescalon on 10/6/24.
//

import SwiftUI

/// Reusable circle view content, provide the desired icon.
struct CircleIconView: View {
    let iconName: String
    
    var body: some View {
        Image(systemName: iconName)
            .frame(width: 60, height: 60)
            .background(Circle().fill(Color.gray.opacity(0.7)))
    }
}

#Preview {
    CircleIconView(iconName: "xmark")
}
