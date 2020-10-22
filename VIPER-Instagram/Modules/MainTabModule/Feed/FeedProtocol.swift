//
//  FeedProtocol.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

// MARK: Router
protocol FeedRouterProtocol: class {
    static func buildFeedView() -> UICollectionViewController?

    // func for redirect

}

// MARK: View
protocol FeedViewProtocol: class {
    var presenter: FeedPresenterProtocol? { get set }

}
// Extends by view to receive notifies from presenter
protocol FeedPresenterDelegate: class {
    //func for presenter -> view
    func presenterDidLoad()
    func feedDidPost(_ feedViewModel: FeedViewModel)
    func reloadData()
}

// MARK: Presenter
protocol FeedPresenterProtocol: class {
    var router: FeedRouterProtocol? { get set }
    var view: (FeedViewProtocol & FeedPresenterDelegate)? { get set }
    var interactor: FeedInteractorProtocol? { get set }

    // func for view -> presenter
    func viewDidLoad()
    func getFeed(at index: IndexPath) -> FeedViewModel
    func getFeedCount() -> Int
    func refresh()
    
    // action
    func openUserProfile(feedIndentifier: IndexPath)
    func fireLikeFeedAction(feedIndentifier: IndexPath)
    func openComments(feedIndentifier: IndexPath)
    func forwardFeed(feedIndentifier: IndexPath)
    func fireBookmarkFeedAction(feedIndentifier: IndexPath)
}
// Extends by presenter to receive notifies from interactor
protocol FeedInteractorDelegate: class {
    //func for interactor -> presenter
    func receiveFeeds(feeds: [FeedModel])
    func feedDidPost(_ feed: FeedModel)

}

// MARK: Interactor
protocol FeedInteractorProtocol: class {
    var presenter: FeedInteractorDelegate? { get set }
    var dataManager: FeedDataManagerProtocol? { get set }

    // func for presenter -> interactor
    func loadMoreFeeds()
    func reloadTimelines()
    func updateLikeStatus(feedId: UInt64, status: Bool)
    func updateBookmarkStatus(feedId: UInt64, status: Bool)
}

// MARK: DataManager
// Manage services to knows about entity
protocol FeedDataManagerProtocol: class {
    // Get list feed start
    func reloadFeeds() -> [FeedModel]
    // Get list feed from $index with $limit
    func fetchFeeds(from index: CLong, limit: Int) -> [FeedModel]
    // Post Feed
    func postFeed(feed: FeedModel, success: (() -> Void?), failure: ((_ error: Int) -> Void?))
    func updateLikeStatus(feedId: UInt64, status: Bool) -> Bool
    func updateBookmarkStatus(feedId: UInt64, status: Bool) -> Bool
}
