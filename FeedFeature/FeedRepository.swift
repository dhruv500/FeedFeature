//
//  FeedFetchRepository.swift
//  FeedFeature
//
//  Created by Dhruv Jaiswal on 05/02/26.
//

import SwiftUI

extension EnvironmentValues {
    @Entry var feedRepo = FeedRepository()
}

actor FeedRepository{
    private var _feeds:[UUID:Feed] = [:]
    private var pageSize:Int = 10
    private let service:FeedFetchService = FeedFetchService()
    
    func fetch(type: FeedListType,page:Int,fromCache:Bool) async -> [Feed] {
        if fromCache{
            print("Fetching from cache for page:\(page)")
            let feeds = fetchCachedFeeds(for: type, till: page)
            return feeds
        }
        else{
            print("Fetching from network for page:\(page)")
            return await fetch(type: type, page: page)
        }
    }
    
    func likeFeed(by id:UUID){
        _feeds[id]?.isLiked.toggle()
    }
    
    private func cache(_ feeds:[Feed]){
        feeds.forEach{
            _feeds[$0.id] = $0
        }
    }
    
    private func fetch(type:FeedListType,page:Int) async -> [Feed]{
        let apiFeeds: [Feed]
        
        switch type {
        case .all:
            apiFeeds = await service.fetchAllFeed(page: page)
        case .liked:
            apiFeeds = await service.fetchLikedFeed(page: page)
        }
        
        cache(apiFeeds)
        let feeds = fetchCachedFeeds(for: type, till: page)
        return feeds
    }
    
    private func fetchCachedFeeds(for type:FeedListType,till page:Int) -> [Feed]{
        var feeds:[Feed]
        
        switch type{
        case .all:
           feeds =  _feeds.values.map{$0}
        case .liked:
            feeds = _feeds.values.filter{$0.isLiked}
        }
        
        feeds.sort(by: {$0.message < $1.message})
        
        let startIndex = 0
        let totalItemsRequested = (page + 1) * pageSize
        let endIndex = min(totalItemsRequested,feeds.count)
        return Array(feeds[startIndex..<endIndex])
    }
}
