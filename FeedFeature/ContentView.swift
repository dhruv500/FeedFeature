//
//  ContentView.swift
//  FeedFeature
//
//  Created by Dhruv Jaiswal on 17/01/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("All", systemImage: "house") {
                AllFeedListView()
            }
            Tab("Liked", systemImage: "heart") {
                LikedFeedListView()
            }
        }
    }
}

#Preview {
    ContentView()
}
