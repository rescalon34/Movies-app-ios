//
//  View+Extensions.swift
//  MoviesApp
//
//  Created by rescalon on 11/6/24.
//

import Foundation
import SwiftUI

extension View {
    
    /// function to add a clear view at the top and bottom of ScrollView
    /// to add a fade effect while scrolling through items.
    func fadedScrollViewMask() -> some View {
        mask(
            LinearGradient(
                colors: [
                    .clear,
                    .primary,
                    .primary,
                    .clear,
                ],
                startPoint: .top, endPoint: .bottom
            )
        )
    }
}
