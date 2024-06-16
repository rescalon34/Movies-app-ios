//
//  VerticalLabelView.swift
//  MoviesApp
//
//  Created by rescalon on 16/6/24.
//

import SwiftUI

/// A reusable view containing an icon and a text horizontally.
///
/// - Parameters:
///   - icon: The given icon to be displayed.
///   - text: The given text to be displayed below the icon.
///   - onButtonClick: A clousure to be performed when tapping on the button view.
///
struct VerticalButtonWithTextView: View {
    
    let icon: String
    let text: String
    let onButtonClick: () -> ()
    
    var body: some View {
        Button {
            onButtonClick()
        } label: {
            VStack {
                Image(systemName: icon)
                    .font(.title3)
                Text(text)
                    .padding(.top, 4)
                    .font(.caption2)
            }
            .foregroundColor(Color.customColors.primaryTextColor.opacity(0.8))
            .bold()
            .textCase(.uppercase)
            .padding(.all, 6)
        }
    }
}

#Preview {
    VerticalButtonWithTextView(
        icon: "arrow.down.to.line.compact",
        text: "Watchlist",
        onButtonClick: {
            
        }
    )
}
