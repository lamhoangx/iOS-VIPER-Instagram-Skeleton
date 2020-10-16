//
//  DummyData.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/15/20.
//

import Foundation

extension InstagramDatabasesManager {
    // DUMMY
    static func initFakeFeeds() -> [FeedModel] {
        // Feed0
        let feed0 = FeedModel(feedId: 0)
        feed0.ownerId = 0
        feed0.usernameOwner = "Feed0"
        feed0.avatarUrlOwner = ""
        feed0.imagesUrlFeed = [""]
        feed0.isBookmark = true
        feed0.isLike =  false
        feed0.likeInfo = LikeFeedInfo(likeNum: 999)
        feed0.caption = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
        feed0.timePost = 999
        
        // Feed1
        let feed1 = FeedModel(feedId: 1)
        feed1.ownerId = 0
        feed1.usernameOwner = "Feed1"
        feed1.avatarUrlOwner = ""
        feed1.imagesUrlFeed = [""]
        feed1.isBookmark = false
        feed1.isLike =  true
        feed1.likeInfo = LikeFeedInfo(likeNum: 999)
        feed1.caption = ""
        feed1.timePost = 999
        
        // Feed2
        let feed2 = FeedModel(feedId: 2)
        feed2.ownerId = 0
        feed2.usernameOwner = "Feed2"
        feed2.avatarUrlOwner = ""
        feed2.imagesUrlFeed = [""]
        feed2.isBookmark = false
        feed2.isLike =  true
        feed2.likeInfo = LikeFeedInfo(likeNum: 999)
        feed2.caption = ""
        feed2.timePost = 999
        
        // Feed3
        let feed3 = FeedModel(feedId: 3)
        feed3.ownerId = 0
        feed3.usernameOwner = "Feed3"
        feed3.avatarUrlOwner = ""
        feed3.imagesUrlFeed = [""]
        feed3.isBookmark = false
        feed3.isLike =  false
        feed3.likeInfo = LikeFeedInfo(likeNum: 999)
        feed3.caption = ""
        feed3.timePost = 999
        
        // Feed4
        let feed4 = FeedModel(feedId: 4)
        feed4.ownerId = 0
        feed4.usernameOwner = "Feed4"
        feed4.avatarUrlOwner = ""
        feed4.imagesUrlFeed = [""]
        feed4.isBookmark = false
        feed4.isLike =  false
        feed4.likeInfo = LikeFeedInfo(likeNum: 999)
        feed4.caption = ""
        feed4.timePost = 999
        
        // Feed5
        let feed5 = FeedModel(feedId: 5)
        feed5.ownerId = 0
        feed5.usernameOwner = "Feed5"
        feed5.avatarUrlOwner = ""
        feed5.imagesUrlFeed = [""]
        feed5.isBookmark = false
        feed5.isLike =  false
        feed5.likeInfo = LikeFeedInfo(likeNum: 999)
        feed5.caption = ""
        feed5.timePost = 999
        
        //Feed6
        let feed6 = FeedModel(feedId: 6)
        feed6.ownerId = 0
        feed6.usernameOwner = "Feed6"
        feed6.avatarUrlOwner = ""
        feed6.imagesUrlFeed = [""]
        feed6.isBookmark = false
        feed6.isLike =  false
        feed6.likeInfo = LikeFeedInfo(likeNum: 999)
        feed6.caption = ""
        feed6.timePost = 999
        
        //Feed7
        let feed7 = FeedModel(feedId: 7)
        feed7.ownerId = 0
        feed7.usernameOwner = "Feed7"
        feed7.avatarUrlOwner = ""
        feed7.imagesUrlFeed = [""]
        feed7.isBookmark = false
        feed7.isLike =  false
        feed7.likeInfo = LikeFeedInfo(likeNum: 999)
        feed7.caption = ""
        feed7.timePost = 999
        
        //Feed8
        let feed8 = FeedModel(feedId: 8)
        feed8.ownerId = 0
        feed8.usernameOwner = "Feed8"
        feed8.avatarUrlOwner = ""
        feed8.imagesUrlFeed = [""]
        feed8.isBookmark = false
        feed8.isLike =  false
        feed8.likeInfo = LikeFeedInfo(likeNum: 999)
        feed8.caption = ""
        feed8.timePost = 999
        
        //Feed9
        let feed9 = FeedModel(feedId: 9)
        feed9.ownerId = 0
        feed9.usernameOwner = "Feed9"
        feed9.avatarUrlOwner = ""
        feed9.imagesUrlFeed = [""]
        feed9.isBookmark = false
        feed9.isLike =  false
        feed9.likeInfo = LikeFeedInfo(likeNum: 999)
        feed9.caption = ""
        feed9.timePost = 999
        
        return [
            feed0,
            feed1,
            feed2,
            feed3,
            feed4,
            feed5,
            feed6,
            feed7,
            feed8,
            feed9
            
        ]
    }
}
