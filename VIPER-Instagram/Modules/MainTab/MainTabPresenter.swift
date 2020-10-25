//
//  MainTabPresenter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class MainTabPresenter: MainTabPresenterProtocol {

    weak var view: (MainTabPresenterDelegate & MainTabViewProtocol)?
    var router: MainTabRouterProtocol?
    var interactor: MainTabInteractorProtocol?
    
    let feedView = FeedRouter.buildFeedView()
    let searchView = SearchRouter.buildSearchView()
//    let postFeedView = PostFeedRouter.buildPostFeedView()
    let notificationView = NotificationRouter.buildNotificationView()
    let userProfile = UserProfileRouter.buildUserProfileView()
    
    let viewNavControllers: [UINavigationController]
    
    init() {
        viewNavControllers = [
            // 1: Feed
            ViewUtils.createNavController(unselectedImage: #imageLiteral(resourceName: "Home"), selectedImage: #imageLiteral(resourceName: "HomeSelected"), rootViewController: feedView!),
            // 2: Search
            ViewUtils.createNavController(unselectedImage: #imageLiteral(resourceName: "Search"), selectedImage: #imageLiteral(resourceName: "SearchSelected"), rootViewController: searchView!),
            // 3: PostFeed
            ViewUtils.createNavController(unselectedImage: #imageLiteral(resourceName: "Post"), selectedImage: #imageLiteral(resourceName: "Post"), rootViewController: nil),
            // 4: Notification #imageLiteral(resourceName: "Activity")
            ViewUtils.createNavController(unselectedImage: #imageLiteral(resourceName: "Activity"), selectedImage: #imageLiteral(resourceName: "ActivitySelected"), rootViewController: notificationView!),
            // 5: Profile - todo//
            ViewUtils.createNavController(unselectedImage: #imageLiteral(resourceName: "Profile"), selectedImage: #imageLiteral(resourceName: "ProfileSelected"), rootViewController: userProfile)
        ]
    }
    
    private func initMainTabNavControllers() {
        view?.tabsControllerDidLoad(viewNavControllers)
    }
    
    private func getNavPostFeedController() -> UINavigationController {
        return viewNavControllers[2]
    }
    
    func prepare() {
        // Loading
        initMainTabNavControllers()
        // Loaded
        view?.presenterDidLoad()
    }
    
    
    
    func shouldTabSelect(viewNavController: UINavigationController) -> Bool {
        if getNavPostFeedController() == viewNavController {
            let navPostFeedController = UINavigationController(rootViewController: PostFeedRouter.buildPostFeedView()!)
            router?.present(from: view as! UIViewController, with: self, target: navPostFeedController)
            return false
        }
        return true
    }
    
    
}

// MARK: Interactor -> Presenter
extension MainTabPresenter: MainTabInteractorDelegate {
}

// MARK: PostFeed -> MainTab
extension MainTabPresenter: PostFeedDelegate {
    func feedDidPost(_ feed: FeedViewModel) {
        
    }
    
    
}
