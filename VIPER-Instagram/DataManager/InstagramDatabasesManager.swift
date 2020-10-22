//
//  InstagramDatabasesManager.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/15/20.
//

import Foundation

class InstagramDatabasesManager {
    static let shared = InstagramDatabasesManager()
    
    private init() {
    }
    
    func getTimelineInit() -> [FeedModel] {
        return fakeFeeds
    }
    
    private let fakeFeeds: [FeedModel] = initFakeFeeds()
    
    func updateLikeStatus(feedId: UInt64, status: Bool) -> Bool {
        for item in fakeFeeds {
            if item.feedId == feedId {
                item.isLike = status
                return true
            }
        }
        return false
    }
    
    func updateBookmarkStatus(feedId: UInt64, status: Bool) -> Bool {
        for item in fakeFeeds {
            if item.feedId == feedId {
                item.isBookmark = status
                return true
            }
        }
        return false
    }
    
}

