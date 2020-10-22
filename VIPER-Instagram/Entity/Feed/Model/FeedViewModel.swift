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
    var imagesUrlFeed: String? // support 1 pic
    var isBookmark: Bool = false
    var isLike: Bool = false
    var likesNumber: UInt64 = 0
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
        feedViewModel.imagesUrlFeed = feedModel.imagesUrlFeed![0] // support first pic
        feedViewModel.isBookmark = feedModel.isBookmark
        feedViewModel.isLike = feedModel.isLike
        feedViewModel.likesNumber = feedModel.likeInfo?.likeNumber ?? 0
        feedViewModel.caption = feedModel.caption
        feedViewModel.timePost = feedModel.timePost
        
        return feedViewModel
    }
    
}
