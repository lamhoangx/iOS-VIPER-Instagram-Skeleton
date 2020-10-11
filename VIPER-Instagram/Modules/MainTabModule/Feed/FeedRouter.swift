//
//  FeedRouter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class FeedRouter: FeedRouterProtocol {

    class func buildFeedView() -> UICollectionViewController? {
        let navController = getFeedView()
        if let view = navController as? (FeedViewProtocol & FeedPresenterDelegate) {
            let presenter = FeedPresenter()
            let interactor = FeedInteractor()
            let router = FeedRouter()
            let dataManager = FeedDataManager()

            // view
            view.presenter = presenter
            
            // presenter
            presenter.view = view
            presenter.router = router
            presenter.interactor = interactor
            
            // interactor
            interactor.presenter = presenter
            interactor.dataManager = dataManager
            
            return navController
        }
        return nil
    }

    static private func getFeedView() -> UICollectionViewController? {
        // Change $view if necessary
        return FeedView()
    }
}
