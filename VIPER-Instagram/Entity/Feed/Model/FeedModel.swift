//
//  FeedModel.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/11/20.
//

import Foundation

// Contain Feed info
class FeedModel {
    let feedId: UInt64
    
    var ownerId: UInt64?
    var usernameOwner: String?
    var avatarUrlOwner: String?
    
    var imagesUrlFeed: [String]?
    var isBookmark: Bool?
    var comments: [CommentFeedModel]?
    var isLike: Bool?
    var likeInfo: LikeFeedInfo?
    var caption: String?
    var timePost: UInt64 = 0
    
    // anything else???
    
    init(feedId: UInt64) {
        self.feedId = feedId
    }
}
