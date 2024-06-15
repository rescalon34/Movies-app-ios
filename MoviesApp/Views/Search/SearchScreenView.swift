//
//  SearchScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 13/6/24.
//

import SwiftUI

struct SearchScreenView: View {
    
    let screenTitle: String
    
    var body: some View {
        BaseScreenView {
            Text(screenTitle)
        }
    }
}

#Preview {
    SearchScreenView(screenTitle: "Search Screen")
}
