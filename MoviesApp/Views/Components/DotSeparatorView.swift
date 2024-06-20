//
//  DotSeparatorView.swift
//  MoviesApp
//
//  Created by rescalon on 19/6/24.
//

import SwiftUI

/// Custom UI to append a mid size dot between a Text
struct DotSeparatorView: View {
    var body: some View {
        Text("●")
            .font(.system(size: 7))
    }
}

#Preview {
    DotSeparatorView()
}
