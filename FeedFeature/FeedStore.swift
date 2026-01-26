//
//  FeedStore.swift
//  FeedFeature
//
//  Created by Dhruv Jaiswal on 17/01/26.
//

import Foundation

@Observable
final class FeedStore{
    static let shared = FeedStore()
    private let service = FeedFetchService()
    private(set) var feeds:[Feed] = []
    
    private init(){ }
    
    func fetchAllFeed() async{
       let allFeeds = await service.fetchAllFeed()
       feeds.upsert(allFeeds)
    }
    
    func fetchLikedFeed() async{
       let likedFeeds = await service.fetchLikedFeed()
       feeds.upsert(likedFeeds)
    }
    
    func likeFeed(id:UUID){
        if let index = feeds.firstIndex(where: {$0.id == id}){
            feeds[index].isLiked.toggle()
        }
    }
}

extension Array where Element == Feed {
    mutating func upsert(_ newFeeds: [Feed]) {
        for feed in newFeeds {
            if let index = firstIndex(where: { $0.id == feed.id }) {
                self[index] = feed          // update existing
            } else {
                self.append(feed)           // insert new
            }
        }
    }
}
