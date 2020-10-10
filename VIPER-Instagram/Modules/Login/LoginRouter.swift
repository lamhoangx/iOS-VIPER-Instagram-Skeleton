//
//  LoginRouter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class LoginRouter: LoginRouterProtocol {

    class func buildLoginView() -> UIViewController? {
        let navController = getLoginView()
        if let view = navController as? (LoginViewProtocol & LoginPresenterDelegate) {
            let presenter = LoginPresenter()
            let interactor = LoginInteractor()
            let router = LoginRouter()
            let dataManager = LoginDataManager()

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

    static private func getLoginView() -> UIViewController? {
        var view: UIViewController?
        // Change $view if necessary
        view = LoginView()
        return view
    }
}
