//
//  NotificationRouter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class NotificationRouter: NotificationRouterProtocol {

    class func buildNotificationView() -> UIViewController? {
        let navController = getNotificationView()
        if let view = navController as? (NotificationViewProtocol & NotificationPresenterDelegate) {
            let presenter = NotificationPresenter()
            let interactor = NotificationInteractor()
            let router = NotificationRouter()
            let dataManager = NotificationDataManager()

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

    static private func getNotificationView() -> UIViewController? {
        var view: UIViewController?
        // Change $view if necessary
        view = NotificationView()
        return view
    }
}
