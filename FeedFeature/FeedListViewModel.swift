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

    func load(type: FeedListType) async {
        guard state.data == nil else { return }

        print("Fetching initial for \(type.name)")

        state = .loading
        let feeds = await fetch(type: type)
        self.state = .loaded(feeds)
    }

    func loadMore(type: FeedListType) async {
        currentPage += 1
        guard currentPage < 5 else {return}

        print("Paginating for \(type.name) page\(currentPage)")

        let feeds = await fetch(type: type)
        let oldData = state.data ?? []
        let newData = oldData + feeds
        self.state = .loaded(newData)
    }

    private func fetch(type: FeedListType) async -> [Feed] {
        let feed: [Feed]

        switch type {
        case .all:
            feed = await service.fetchAllFeed(page: currentPage)
        case .liked:
            feed = await service.fetchLikedFeed(page: currentPage)
        }

        return feed
    }

    func likePost(id: UUID) async {
        guard var data = state.data else {return}

        Task {
            await service.likeFeed(id: id)
        }

        if let index = data.firstIndex(where: {$0.id == id}) {
            data[index].isLiked.toggle()
        }
        self.state = .loaded(data)
    }
}
