//
//  FeedCellView.swift
//  FeedFeature
//
//  Created by Dhruv Jaiswal on 17/01/26.
//

import SwiftUI

struct FeedCellView:View {
    let feed:Feed
    let likeBtnTap:() -> Void
    
    var body: some View {
        HStack(spacing: 24){
            Text(feed.message)
            Spacer()
            HStack {
                Button {
                    likeBtnTap()
                } label: {
                    Image(systemName: feed.isLiked ? "heart.fill" : "heart")
                }
            }
            .buttonStyle(.plain)
            .tint(.red)
            .font(.caption)
        }
        .contentShape(Rectangle())
    }
}

#Preview {
    FeedCellView(feed: Feed.sampleFeeds[0], likeBtnTap: {})
}
