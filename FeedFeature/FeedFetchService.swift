//
//  FeedFetchService.swift
//  FeedFeature
//
//  Created by Dhruv Jaiswal on 17/01/26.
//

import Foundation

struct FeedFetchService{
    func fetchAllFeed() async -> [Feed]{
        try? await Task.sleep(for: .seconds(.random(in: 0.5...1.5)))
        return Feed.sampleFeeds
    }
    
    func fetchLikedFeed() async -> [Feed]{
        try? await Task.sleep(for: .seconds(.random(in: 0.5...1.5)))
        return Feed.sampleFeeds.filter{$0.isLiked}
    }
}
