//
//  FeedPresenter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation

class FeedPresenter: FeedPresenterProtocol {
    
    private let feedDispatchQueue = DispatchQueue(label: "feed-dispatch-queue")
    
    weak var view: (FeedViewProtocol & FeedPresenterDelegate)?
    var router: FeedRouterProtocol?
    var interactor: FeedInteractorProtocol?
    private var timelines : [UInt64: FeedViewModel] = [:]
    private var currentFeeds: [(UInt64, FeedViewModel)] = []
    
    func viewDidLoad() {
        // Presenter do something
        feedDispatchQueue.async { [self] in
            self.interactor?.reloadTimelines()
        }
        // Done
        view?.presenterDidLoad()
    }
    
    func getFeed(at index: IndexPath) -> FeedViewModel {
        return currentFeeds[index.row].1
    }
    
    func getFeedCount() -> Int {
        return currentFeeds.count
    }
    
    func refresh() {
        feedDispatchQueue.async {
            self.interactor?.reloadTimelines()
        }
    }
    
    //================= ACTION VIEW ==================//
    // Action from VIEW
    func openUserProfile(feedIndentifier: IndexPath) {
        
    }
    
    func fireLikeFeedAction(feedIndentifier: IndexPath) {
        feedDispatchQueue.async { [self] in
            let targetFeed = getFeed(at: feedIndentifier)
            let feedID = targetFeed.feedId
            let currentLikeStatus = timelines[feedID]?.isLike
            if let likeStatus = currentLikeStatus {
                // begin transaction
                timelines[feedID]?.isLike = !likeStatus
                interactor?.updateLikeStatus(feedId: feedID, status: !likeStatus)
                //transaction success
                //end transaction
                DispatchQueue.main.async { [self] in
                    view?.reloadData()
                }
            }
        }
    }
    
    func fireBookmarkFeedAction(feedIndentifier: IndexPath) {
        feedDispatchQueue.async { [self] in
            let targetFeed = getFeed(at: feedIndentifier)
            let feedID = targetFeed.feedId
            let currentBookmarkStatus = timelines[feedID]?.isBookmark
            if let bookmarkStatus = currentBookmarkStatus {
                // begin transaction
                timelines[feedID]?.isBookmark = !bookmarkStatus
                interactor?.updateBookmarkStatus(feedId: feedID, status: !bookmarkStatus)
                //transaction success
                //end transaction
                DispatchQueue.main.async { [self] in
                    view?.reloadData()
                }
            }
        }
    }
    
    func openComments(feedIndentifier: IndexPath) {
        
    }
    
    func forwardFeed(feedIndentifier: IndexPath) {
        
    }
}

// MARK: Interactor -> Presenter
extension FeedPresenter: FeedInteractorDelegate {
    func feedDidPost(_ feed: FeedModel) {
        let feedViewModel = FeedViewModel.create(feedModel: feed)
        timelines.updateValue(feedViewModel, forKey: feed.feedId)
        
        currentFeeds.insert((feed.feedId, feedViewModel), at: 0)
        DispatchQueue.main.async { [self] in
            view?.feedDidPost(feedViewModel)
            view?.reloadData()
        }
    }
    
    func receiveFeeds(feeds: [FeedModel]) {
        feeds.forEach() {
            let feedViewModel = FeedViewModel.create(feedModel: $0)
            timelines.updateValue(feedViewModel, forKey: $0.feedId)
        }
        // Sort by key - change if necessary
        let sortResult = timelines.sorted { (v1, v2) -> Bool in
            return v1.key > v2.key
        }
        currentFeeds = sortResult
        DispatchQueue.main.async { [self] in
            view?.reloadData()
        }
    }
    
}
