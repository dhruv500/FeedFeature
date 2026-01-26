//
//  FeedModel.swift
//  FeedFeature
//
//  Created by Dhruv Jaiswal on 17/01/26.
//

import Foundation

struct Feed:Identifiable,Equatable{
    let id = UUID()
    let message:String
    var isLiked:Bool
}

extension Feed{
   static let sampleFeeds: [Feed] = [
        Feed(message: "Just shipped a new feature 🚀", isLiked: false),
        Feed(message: "SwiftUI state management finally makes sense", isLiked: true),
        Feed(message: "Debugging is just problem-solving with extra steps", isLiked: false),
        Feed(message: "Coffee + Xcode = productivity ☕️", isLiked: true),
        Feed(message: "Refactoring old code feels so satisfying", isLiked: false),
        Feed(message: "Async/await cleaned up my networking layer", isLiked: true),
        Feed(message: "Build times still hurt 😭", isLiked: false),
        Feed(message: "Declarative UI is a mindset shift", isLiked: true),
        Feed(message: "Small commits, big peace of mind", isLiked: false),
        Feed(message: "Today’s goal: write less but better code", isLiked: true)
    ]
}
