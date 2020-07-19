//
//  Result.swift
//  TechNews
//
//  Created by DAPL-Asset-290 on 29/06/20.
//  Copyright © 2020 DAPL-Asset-290. All rights reserved.
//

import Foundation

struct Result : Codable {
    let hits : [Post]
}

struct Post : Codable, Identifiable {
    var id : String {
        return objectID
    }
    
    let objectID : String
    let points : Int
    let url : String?
    let title : String
    let author : String?
    let storyTitle : String?
    let storyURL : String?
    let storyText: String?
    let commentText: String?
    
    enum CodingKeys: String, CodingKey {
        case title, url, author, points
        case storyText = "story_text"
        case commentText = "comment_text"
        case storyTitle = "story_title"
        case storyURL = "story_url"
        case objectID
    }
}
