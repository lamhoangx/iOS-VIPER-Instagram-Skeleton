//
//  FeedDataManager.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation

class FeedDataManager: FeedDataManagerProtocol {
    func reloadFeeds() -> [FeedModel] {
        return InstagramDatabasesManager.shared.getTimelineInit()
    }
    
    func fetchFeeds(from index: CLong, limit: Int) -> [FeedModel] {
        return []
    }
    
    func postFeed(feed: FeedModel, success: (() -> Void?), failure: ((Int) -> Void?)) {
        
    }
    
    
}
