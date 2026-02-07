//
//  PostListView.swift
//  FeedFeature
//
//  Created by Dhruv Jaiswal on 05/02/26.
//

import SwiftUI

struct FeedListView:View {
    let type: FeedListType
    
    @Environment(\.feedRepo) var feedRepo
    @State private var vm: FeedListViewModel?
    
    var body: some View {
        Group{
            if let vm{
                FeedListContentView(type: type, vm: vm)
            }
            else{
                ProgressView()
            }
        }
        .task {
            guard vm == nil else{return}
            vm = FeedListViewModel(feedRepo: feedRepo)
        }
        
    }
}

fileprivate
struct FeedListContentView: View {
    let type: FeedListType
    var vm: FeedListViewModel

    var body: some View {
        NavigationStack {
            Group {
                switch vm.state {
                case .idle:
                    Text("Idle")
                case .loading:
                    ProgressView("Loading...")
                case .loaded(let feeds):
                    if feeds.isEmpty {
                        ContentUnavailableView("No results found!",
                                               systemImage: "magnifyingglass")
                    } else {
                        List {
                            ForEach(feeds) { feed in
                                FeedCellView(feed: feed) {
                                    Task {
                                        await vm.likePost(id: feed.id)
                                    }
                                }
                                .padding()
                            }

                            // Paginate
                            Color.clear
                                .frame(height: 32)
                                .task {
                                    await vm.loadMore(type: type)
                                }
                        }
                    }
                case .error(let message):
                    Text(message)
                        .foregroundStyle(.pink)
                }
            }
            .navigationTitle("FeedList \(type.name)")
        }
        .task {
            await vm.load(type: type)
        }
    }
}

#Preview {
    FeedListView(type: .all)
}
