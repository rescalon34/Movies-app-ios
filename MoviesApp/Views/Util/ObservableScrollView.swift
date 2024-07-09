//
//  ObservableScrollView.swift
//  MoviesApp
//
//  Created by rescalon on 9/6/24.
//

import SwiftUI


/// A custom scroll view that tracks and updates its content offset.
///
/// This view wraps a `ScrollView` and uses a `GeometryReader` to observe the vertical
/// content offset and sends it  back to the parent view through a binding variable.
/// It also allows for dynamic updates and reactions based on the scroll position.
struct ObservableScrollView<Content: View>: View {
    let content: Content
    @Binding var contentOffset: CGFloat
    
    init(contentOffset: Binding<CGFloat>, @ViewBuilder content: () -> Content) {
        self._contentOffset = contentOffset
        self.content = content()
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            content
                .background {
                    GeometryReader { geometry in
                        Color.clear
                            .preference(
                                key: ContentOffsetKey.self,
                                value: geometry.frame(in: .named(Constants.SCROLLVIEW_NAME)).minY
                            )
                    }
                }
                .padding(.bottom, 50)
        }
        .coordinateSpace(name: Constants.SCROLLVIEW_NAME)
        .onPreferenceChange(ContentOffsetKey.self) { value in
            self.contentOffset = value
        }
    }
}
