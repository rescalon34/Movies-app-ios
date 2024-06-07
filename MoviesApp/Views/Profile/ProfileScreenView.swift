//
//  ProfileScreenView.swift
//  MoviesApp
//
//  Created by rescalon on 5/6/24.
//

import SwiftUI

struct ProfileScreenView: View {
    
    var body: some View {
        BaseScreenView {
            Text("Profile Screen")
                .foregroundColor(.customColors.secondaryTextColor)
        }
    }
}

#Preview {
    ProfileScreenView()
}
