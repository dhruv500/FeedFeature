//
//  FeedModel.swift
//  FeedFeature
//
//  Created by Dhruv Jaiswal on 17/01/26.
//

import Foundation

enum FeedListType {
    case all
    case liked
    
    var name: String {
        switch self {
        case .all:
            return "All"
        case .liked:
            return "Liked"
        }
    }
}

nonisolated
struct Feed: Identifiable, Equatable,Hashable {
    let id = UUID()
    let message: String
    var isLiked: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

nonisolated
extension Feed {
    // 50 items
    // 25 liked
    static var sampleFeeds: [Feed] = [
        Feed(message: "Accessibility matters, always", isLiked: false),
        Feed(message: "Async/await cleaned up my networking layer", isLiked: true),
        Feed(message: "Best practices are a must", isLiked: false),
        Feed(message: "Build times still hurt 😭", isLiked: false),
        Feed(message: "Clean code is easy to read", isLiked: true),
        Feed(message: "Clean code is happy code", isLiked: true),
        Feed(message: "Code, test, repeat", isLiked: true),
        Feed(message: "Code is a craft, not just typing", isLiked: true),
        Feed(message: "Code is a journey, not a destination", isLiked: true),
        Feed(message: "Code is a language", isLiked: true),
        Feed(message: "Code is a work of art", isLiked: true),
        Feed(message: "Code is read more often than written", isLiked: true),
        Feed(message: "Code quality matters", isLiked: false),
        Feed(message: "Code refactoring is therapeutic", isLiked: false),
        Feed(message: "Code reviews are a team sport", isLiked: true),
        Feed(message: "Coffee + Xcode = productivity ☕️", isLiked: true),
        Feed(message: "Debugging is a skill", isLiked: false),
        Feed(message: "Debugging is just problem-solving with extra steps", isLiked: false),
        Feed(message: "Declarative UI is a mindset shift", isLiked: true),
        Feed(message: "Design patterns are your friend", isLiked: true),
        Feed(message: "Documentation is key", isLiked: false),
        Feed(message: "Don’t be a stranger, say hi 👋", isLiked: true),
        Feed(message: "Focus on solving problems, not just writing code", isLiked: false),
        Feed(message: "iOS development is a blast", isLiked: false),
        Feed(message: "Just shipped a new feature 🚀", isLiked: true),
        Feed(message: "Keep it simple, stupid (KISS)", isLiked: false),
        Feed(message: "Learning from mistakes is key", isLiked: false),
        Feed(message: "Learning is a lifelong process", isLiked: false),
        Feed(message: "New project, new challenges", isLiked: true),
        Feed(message: "Pair programming is underrated", isLiked: false),
        Feed(message: "Performance optimization is an art", isLiked: true),
        Feed(message: "Practice makes perfect", isLiked: false),
        Feed(message: "Problem-solving is fun", isLiked: false),
        Feed(message: "Refactoring old code feels so satisfying", isLiked: false),
        Feed(message: "Small commits, big peace of mind", isLiked: false),
        Feed(message: "Stay curious, stay hungry", isLiked: false),
        Feed(message: "Stay focused, stay productive", isLiked: false),
        Feed(message: "Stay up-to-date with tech", isLiked: true),
        Feed(message: "Swift community is amazing", isLiked: false),
        Feed(message: "Swift is evolving fast", isLiked: true),
        Feed(message: "Swift is the best thing since sliced bread", isLiked: false),
        Feed(message: "SwiftUI is the future", isLiked: false),
        Feed(message: "SwiftUI state management finally makes sense", isLiked: true),
        Feed(message: "Teamwork makes the dream work", isLiked: true),
        Feed(message: "Testing is not optional", isLiked: true),
        Feed(message: "Today’s goal: write less but better code", isLiked: true),
        Feed(message: "UI testing is a puzzle to solve", isLiked: true),
        Feed(message: "Unit testing is essential", isLiked: false),
        Feed(message: "WWDC is the best conference", isLiked: true),
        Feed(message: "Xcode is a powerful tool", isLiked: true)
    ]
}
