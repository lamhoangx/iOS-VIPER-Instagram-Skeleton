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
        
    func prepare() {
        // Loading
        initMainTabNavControllers()
        // Loaded
        view?.presenterDidLoad()
    }
    
    private func initMainTabNavControllers() {
        view?.tabsControllerDidLoad(
            [
                // Feed
                ViewUtils.createNavController(unselectedImage: #imageLiteral(resourceName: "Home"), selectedImage: #imageLiteral(resourceName: "HomeSelected"), rootViewController: FeedRouter.buildFeedView()!),
                // Search
                ViewUtils.createNavController(unselectedImage: #imageLiteral(resourceName: "Search"), selectedImage: #imageLiteral(resourceName: "SearchSelected"), rootViewController: SearchRouter.buildSearchView()!),
                // PostFeed
                ViewUtils.createNavController(unselectedImage: #imageLiteral(resourceName: "Post"), selectedImage: #imageLiteral(resourceName: "Post"), rootViewController: PostFeedRouter.buildPostFeedView()!),
                // Notification
                ViewUtils.createNavController(unselectedImage: #imageLiteral(resourceName: "Activity"), selectedImage: #imageLiteral(resourceName: "ActivitySelected"), rootViewController: NotificationRouter.buildNotificationView()!),
                // Profile - todo//
                ViewUtils.createNavController(unselectedImage: #imageLiteral(resourceName: "Profile"), selectedImage: #imageLiteral(resourceName: "ProfileSelected"), rootViewController: FeedRouter.buildFeedView()!)
            ]
        )
    }
}

// MARK: Interactor -> Presenter
extension MainTabPresenter: MainTabInteractorDelegate {
}
