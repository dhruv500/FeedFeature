//
//  FeedFetchService.swift
//  FeedFeature
//
//  Created by Dhruv Jaiswal on 17/01/26.
//

import Foundation

nonisolated
struct FeedFetchService{
    let delay = 2.0
    
    func fetchAllFeed(page:Int = 0) async -> [Feed]{
        try? await Task.sleep(for: .seconds(delay))
        let feeds = Feed.sampleFeeds
        let paginatedFeeds = paginate(feeds: feeds, page: page)
        return paginatedFeeds
    }
    
    func fetchLikedFeed(page:Int = 0) async -> [Feed]{
        try? await Task.sleep(for: .seconds(delay))
        let feeds = Feed.sampleFeeds.filter{$0.isLiked}
        let paginatedFeeds = paginate(feeds: feeds, page: page)
        return paginatedFeeds
    }
    
    func likeFeed(id:UUID) async{
       //try? await Task.sleep(for: .seconds(delay))
        if let index = Feed.sampleFeeds.firstIndex(where: {$0.id == id}){
            Feed.sampleFeeds[index].isLiked.toggle()
        }
    }
    
    private func paginate(feeds: [Feed], page: Int, pageSize: Int = 10) -> [Feed] {
        let startIndex = page * pageSize
        let endIndex = min(startIndex + pageSize, feeds.count)
        guard startIndex < feeds.count else { return [] }
        return Array(feeds[startIndex..<endIndex])
    }
}
