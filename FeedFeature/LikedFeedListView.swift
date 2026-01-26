//
//  LikedFeedListView.swift
//  FeedFeature
//
//  Created by Dhruv Jaiswal on 17/01/26.
//

import SwiftUI

struct LikedFeedListView: View {
    @State private var vm = LikedFeedListViewModel()
    
    var body: some View {
        let _ = Self._printChanges()
        NavigationStack{
            List{
                ForEach(vm.feeds) { feed in
                    FeedCellView(feed: feed) {
                        vm.likeFeed(id: feed.id)
                    }
                }
            }
            .task {
               guard vm.feeds.isEmpty else{return}
               await vm.loadFeed()
            }
            .navigationTitle("Liked Feed")
        }
    }
}

@Observable
fileprivate final class LikedFeedListViewModel{
    //FIXME: - Anti pattern
    private let store = FeedStore.shared
    
    var feeds:[Feed]{
        store.feeds.filter{$0.isLiked}
    }
    
    func loadFeed() async{
       await store.fetchLikedFeed()
    }
    
    func likeFeed(id:UUID){
        store.likeFeed(id: id)
    }
}

#Preview {
    LikedFeedListView()
}
