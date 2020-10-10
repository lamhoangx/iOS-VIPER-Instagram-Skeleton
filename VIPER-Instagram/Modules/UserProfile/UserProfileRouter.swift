//
//  UserProfileRouter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class UserProfileRouter: UserProfileRouterProtocol {

    class func buildUserProfileView() -> UIViewController? {
        let navController = getUserProfileView()
        if let view = navController as? (UserProfileViewProtocol & UserProfilePresenterDelegate) {
            let presenter = UserProfilePresenter()
            let interactor = UserProfileInteractor()
            let router = UserProfileRouter()
            let dataManager = UserProfileDataManager()

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

    static private func getUserProfileView() -> UIViewController? {
        var view: UIViewController?
        // Change $view if necessary
        view = UserProfileView()
        return view
    }
}
