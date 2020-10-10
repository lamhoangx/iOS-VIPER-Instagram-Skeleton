//
//  TimelineRouter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class TimelineRouter: TimelineRouterProtocol {

    class func buildTimelineView() -> UIViewController? {
        let navController = getTimelineView()
        if let view = navController as? (TimelineViewProtocol & TimelinePresenterDelegate) {
            let presenter = TimelinePresenter()
            let interactor = TimelineInteractor()
            let router = TimelineRouter()
            let dataManager = TimelineDataManager()

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

    static private func getTimelineView() -> UIViewController? {
        var view: UIViewController?
        // Change $view if necessary
        view = TimelineView()
        return view
    }
}
