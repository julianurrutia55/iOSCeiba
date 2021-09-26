//
//  PostItem.swift
//  PruebaCeibaiOS
//
//  Created by Usser on 25/09/21.
//

import Foundation

struct PostItem: Decodable {
    let id: Int
    let title: String
    let body: String
    
    init(post: Post) {
        self.id = post.id
        self.title = post.title
        self.body = post.body
    }
}

// MARK: - Post
struct Post: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
