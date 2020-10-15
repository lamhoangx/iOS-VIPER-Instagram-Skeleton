//
//  FeedViewModel.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/11/20.
//

import Foundation
import UIKit

// Contain info using by FeedCell
class FeedViewModel {
    let feedId: UInt64
    var userName: String?
    var avatarUrl: String?
    var imagesUrlFeed: [String]?
    var isBookmark: Bool?
    var isLike: Bool?
    var likesNumber: UInt64?
    var caption: String?
    var timePost: UInt64?
    // comments is coming
    
    private init(feedId: UInt64) {
        self.feedId = feedId
    }
    
    static func create(feedModel: FeedModel) -> FeedViewModel {
        let feedViewModel = FeedViewModel(feedId: feedModel.feedId)
        feedViewModel.userName = feedModel.usernameOwner
        feedViewModel.avatarUrl = feedModel.avatarUrlOwner
        feedViewModel.imagesUrlFeed = feedModel.imagesUrlFeed
        feedViewModel.isBookmark = feedModel.isBookmark
        feedViewModel.isLike = feedModel.isLike
        feedViewModel.likesNumber = feedModel.likeInfo?.likeNumber
        feedViewModel.caption = feedModel.caption
        feedViewModel.timePost = feedModel.timePost
        
        return feedViewModel
    }
    
}