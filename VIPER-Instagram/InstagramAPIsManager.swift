//
//  InstagramAPIsManager.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/15/20.
//

import Foundation

class InstagramAPIsManager {
    static func reloadFeeds() -> [FeedModel] {
        return fetchFeeds(index: 0, limit: 10)
    }
    static func fetchFeeds(index: CLong, limit: Int) -> [FeedModel] {
        return []
    }
    
}
