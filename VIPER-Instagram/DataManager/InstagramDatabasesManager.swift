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
    
}

