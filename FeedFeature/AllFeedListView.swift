//
//  AllFeedListView.swift
//  FeedFeature
//
//  Created by Dhruv Jaiswal on 17/01/26.
//

import SwiftUI

struct AllFeedListView: View {
    @State private var vm = AllFeedListViewModel()
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
            .navigationTitle("All Feed")
        }
    }
}

@Observable
fileprivate final class AllFeedListViewModel{
    //FIXME: - Anti pattern
    private let store = FeedStore.shared
    
    var feeds:[Feed]{
        store.feeds
    }
    
    func loadFeed() async{
       await store.fetchAllFeed()
    }
    
    func likeFeed(id:UUID){
        store.likeFeed(id: id)
    }
}

#Preview {
    AllFeedListView()
}
