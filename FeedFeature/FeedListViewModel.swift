//
//  FeedListViewModel.swift
//  FeedFeature
//
//  Created by Dhruv Jaiswal on 05/02/26.
//

import Foundation

@Observable
final class FeedListViewModel {
    private(set) var state: LoadingState<[Feed]> = .idle

    private var currentPage: Int = 0
    private let service: FeedFetchService = FeedFetchService()
    private let feedRepo:FeedRepository = FeedRepository.shared
    
    var loadFromCache:Bool{
        state.data != nil
    }

    func load(type: FeedListType) async {
        if loadFromCache{
            state = .loading
        }
        
        let feeds = await feedRepo.fetch(type: type, page: currentPage, fromCache: loadFromCache)
        self.state = .loaded(feeds)
    }

    func loadMore(type: FeedListType) async {
        currentPage += 1
        guard currentPage < 5 else {return}
        
        print("Paginating for \(type.name) page\(currentPage)")
        
        let feeds = await feedRepo.fetch(type: type, page: currentPage, fromCache: false)
        self.state = .loaded(feeds)
    }

    func likePost(id: UUID) async {
        guard var data = state.data else {return}

        Task {
            await feedRepo.likeFeed(by: id)
        }

        if let index = data.firstIndex(where: {$0.id == id}) {
            data[index].isLiked.toggle()
        }
        self.state = .loaded(data)
    }
}
