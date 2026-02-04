//
//  ContentView.swift
//  FeedFeature
//
//  Created by Dhruv Jaiswal on 17/01/26.
//

import SwiftUI

struct ContentView: View {
    // TODO: Sync data between 2 FeedListView

    var body: some View {
        TabView {
            Tab("All", systemImage: "house") {
                FeedListView(type: .all)
            }
            Tab("Liked", systemImage: "heart") {
                FeedListView(type: .liked)
            }
        }
    }
}

#Preview {
    ContentView()
}
