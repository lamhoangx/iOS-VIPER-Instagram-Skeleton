//
//  SearchRouter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class SearchRouter: SearchRouterProtocol {

    class func buildSearchView() -> UIViewController? {
        let navController = getSearchView()
        if let view = navController as? (SearchViewProtocol & SearchPresenterDelegate) {
            let presenter = SearchPresenter()
            let interactor = SearchInteractor()
            let router = SearchRouter()
            let dataManager = SearchDataManager()

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

    static private func getSearchView() -> UIViewController? {
        var view: UIViewController?
        // Change $view if necessary
        view = SearchView()
        return view
    }
}
