//
//  MainTabRouter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class MainTabRouter: MainTabRouterProtocol {

    class func buildMainTabView() -> UITabBarController? {
        let navController = getMainTabView()
        if let view = navController as? (MainTabPresenterDelegate & MainTabViewProtocol) {
            let presenter = MainTabPresenter()
            let interactor = MainTabInteractor()
            let router = MainTabRouter()
            let dataManager = MainTabDataManager()

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

    static private func getMainTabView() -> UITabBarController? {
        var tabBar: UITabBarController?
        // Change $view if necessary
        tabBar = MainTabView()
        return tabBar
    }

}
