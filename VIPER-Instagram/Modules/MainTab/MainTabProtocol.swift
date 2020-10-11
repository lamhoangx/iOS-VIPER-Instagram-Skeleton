//
//  MainTabProtocol.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

// MARK: Router
protocol MainTabRouterProtocol: class {
    static func buildMainTabView() -> UITabBarController?

    // func for redirect
    func present(from: UIViewController, with delegate: PostFeedDelegate, target desViewController: UIViewController)
}

// MARK: View
protocol MainTabViewProtocol: class {
    var presenter: MainTabPresenterProtocol? { get set }

    // func for presenter -> view
    
    
}

protocol MainTabPresenterDelegate {
    func presenterDidLoad()
    func tabsControllerDidLoad(_ controllers: [UINavigationController])
}

// MARK: Presenter
protocol MainTabPresenterProtocol: class {
    var router: MainTabRouterProtocol? { get set }
    var view: (MainTabPresenterDelegate & MainTabViewProtocol)? { get set }
    var interactor: MainTabInteractorProtocol? { get set }

    // func for view -> presenter
    func prepare()
    func shouldTabSelect(viewNavController: UINavigationController) -> Bool
}
// Extends by presenter to receive notifies from interactor
protocol MainTabInteractorDelegate: class {
    //func for interactor -> presenter

}

// MARK: Interactor
protocol MainTabInteractorProtocol: class {
    var presenter: MainTabInteractorDelegate? { get set }
    var dataManager: MainTabDataManagerProtocol? { get set }

    // func for presenter -> interactor

}

// MARK: DataManager
// Manage services to knows about entity
protocol MainTabDataManagerProtocol: class {

}
