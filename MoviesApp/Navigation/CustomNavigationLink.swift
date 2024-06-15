//
//  CustomNavigationLink.swift
//  MoviesApp
//
//  Created by rescalon on 14/6/24.
//

import SwiftUI

/// Reusable NavigationDestinationLink to set common view modifiers once.
struct CustomNavigationLink<Destination: View, Label: View>: View {
    var destination: Destination
    var label: () -> Label
    
    var body: some View {
        NavigationLink(destination: destination) {
            label()
        }
        .listRowBackground(Color.customColors.backgroundColor)
    }
}
