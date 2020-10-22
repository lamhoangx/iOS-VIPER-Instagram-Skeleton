//
//  FeedInteractor.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation

class FeedInteractor: FeedInteractorProtocol {

    internal weak var presenter: FeedInteractorDelegate?
    internal var dataManager: FeedDataManagerProtocol?
    
    // Get newest feeds to show onto timelines
    func reloadTimelines() {
        let feeds = (dataManager?.reloadFeeds())!
        handleFeedIndex(feeds: feeds)
    }
    
    // impl business to decide feed index show onto timelines ( fist to last)
    private func handleFeedIndex(feeds: [FeedModel]) {
        // do something
        //
        presenter?.receiveFeeds(feeds: feeds)
    }
    
    func loadMoreFeeds() {
        // get more
        guard let feedsMore = dataManager?.fetchFeeds(from: 0, limit: 10) else {
            // failure
            return
        }
        //
        handleFeedIndex(feeds: feedsMore)
    }
    
    func postFeed(feed: FeedModel) {
        dataManager?.postFeed(
            feed: feed,
            success: ({
                presenter?.feedDidPost(feed)
            }),
            failure: ({ (errorCode: Int) in
                
            })
        )
    }

    func updateLikeStatus(feedId: UInt64, status: Bool) {
        if dataManager?.updateLikeStatus(feedId: feedId, status: status) == true {
            
        }
    }
    
    func updateBookmarkStatus(feedId: UInt64, status: Bool) {
        if dataManager?.updateBookmarkStatus(feedId: feedId, status: status) == true {
            
        }
    }
    
    
}

