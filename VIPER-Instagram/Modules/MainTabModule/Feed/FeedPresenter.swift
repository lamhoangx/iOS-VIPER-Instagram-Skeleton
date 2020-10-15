//
//  FeedPresenter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation

class FeedPresenter: FeedPresenterProtocol {
    
    weak var view: (FeedViewProtocol & FeedPresenterDelegate)?
    var router: FeedRouterProtocol?
    var interactor: FeedInteractorProtocol?
    private var timelines : [UInt64: FeedViewModel] = [:]
    private var currentFeeds: [FeedViewModel] = []
        
    func viewDidLoad() {
        // Presenter do something 
        interactor?.reloadTimelines()
        // Done
        view?.presenterDidLoad()
    }
    
    func getFeed(at index: IndexPath) -> FeedViewModel {
        return currentFeeds[index.row]
    }
    
    func getFeedCount() -> Int {
        timelines.count
    }
}

// MARK: Interactor -> Presenter
extension FeedPresenter: FeedInteractorDelegate {
    func feedDidPost(_ feed: FeedModel) {
        let feedViewModel = FeedViewModel.create(feedModel: feed)
        timelines.updateValue(feedViewModel, forKey: feed.feedId)
        view?.feedDidPost(feedViewModel)
        self.currentFeeds.insert(feedViewModel, at: 0)
    }
    
    func receiveFeeds(feeds: [FeedModel]) {
        feeds.forEach() {
            let feedViewModel = FeedViewModel.create(feedModel: $0)
            timelines.updateValue(feedViewModel, forKey: $0.feedId)
            self.currentFeeds.append(feedViewModel)
        }
        
    }
    
}
