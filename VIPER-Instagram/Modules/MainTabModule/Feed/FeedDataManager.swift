//
//  FeedDataManager.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation

class FeedDataManager: FeedDataManagerProtocol {
    // update server via API
    
    
    func updateLikeStatus(feedId: UInt64, status: Bool) -> Bool {
        return InstagramDatabasesManager.shared.updateLikeStatus(feedId: feedId, status: status)
    }
    
    func updateBookmarkStatus(feedId: UInt64, status: Bool) -> Bool {
        return InstagramDatabasesManager.shared.updateBookmarkStatus(feedId: feedId, status: status)
    }
    
    func reloadFeeds() -> [FeedModel] {
        return InstagramDatabasesManager.shared.getTimelineInit()
    }
    
    func fetchFeeds(from index: CLong, limit: Int) -> [FeedModel] {
        return []
    }
    
    func postFeed(feed: FeedModel, success: (() -> Void?), failure: ((Int) -> Void?)) {
        
    }
    
    
}
