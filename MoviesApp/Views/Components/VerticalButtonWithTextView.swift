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
    var iconForegroundColor: Color? = nil
    let text: String
    var shouldAnimate: Bool = false
    let onButtonClick: () -> ()
    
    var body: some View {
        Button {
            onButtonClick()
        } label: {
            VStack {
                Image(systemName: icon)
                    .font(.title3)
                    .foregroundColor(iconForegroundColor ?? Color.customColors.primaryTextColor.opacity(0.8)
                    )
                    .rotationEffect(.degrees( shouldAnimate ? 360 : 0 ))
                    .animation(.easeInOut(duration: 0.5), value: shouldAnimate)
                
                Text(text)
                    .padding(.top, 4)
                    .font(.caption2)
                    .foregroundColor(Color.customColors.primaryTextColor.opacity(0.8))
            }
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
        onButtonClick: { }
    )
}
