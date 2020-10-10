//
//  PostFeedRouter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class PostFeedRouter: PostFeedRouterProtocol {

    class func buildPostFeedView() -> UIViewController? {
        let navController = getPostFeedView()
        if let view = navController as? (PostFeedViewProtocol & PostFeedPresenterDelegate) {
            let presenter = PostFeedPresenter()
            let interactor = PostFeedInteractor()
            let router = PostFeedRouter()
            let dataManager = PostFeedDataManager()

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

    static private func getPostFeedView() -> UIViewController? {
        var view: UIViewController?
        // Change $view if necessary
        view = PostFeedView()
        return view
    }
}
