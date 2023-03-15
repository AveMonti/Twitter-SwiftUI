//
//  TweetModel.swift
//  TwitterTest
//
//  Created by Mateusz Chojnacki on 23/02/2023.
//

import Foundation

struct TweetModel: Hashable, Codable, Identifiable {
    let id: Int
    let username: String
    let date: String
    let text: String
    var likes: Int
    var comments: [TweetModel]
    let retweets: Int
    let imageUrl: String?
    let avatarUrl: String
    
    var dateContent:Date {
        let formatter = ISO8601DateFormatter()
        return formatter.date(from: date) ?? Date()
    }
}
