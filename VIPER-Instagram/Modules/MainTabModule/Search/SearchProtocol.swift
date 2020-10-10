//
//  SearchProtocol.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

// MARK: Router
protocol SearchRouterProtocol: class {
    static func buildSearchView() -> UIViewController?

    // func for redirect

}

// MARK: View
protocol SearchViewProtocol: class {
    var presenter: SearchPresenterProtocol? { get set }

}
// Extends by view to receive notifies from presenter
protocol SearchPresenterDelegate: class {
    //func for presenter -> view
    func presenterDidLoad()
}

// MARK: Presenter
protocol SearchPresenterProtocol: class {
    var router: SearchRouterProtocol? { get set }
    var view: (SearchViewProtocol & SearchPresenterDelegate)? { get set }
    var interactor: SearchInteractorProtocol? { get set }

    // func for presenter -> interactor
    func viewDidLoad()

}
// Extends by presenter to receive notifies from interactor
protocol SearchInteractorDelegate: class {
    //func for interactor -> presenter

}

// MARK: Interactor
protocol SearchInteractorProtocol: class {
    var presenter: SearchInteractorDelegate? { get set }
    var dataManager: SearchDataManagerProtocol? { get set }

    // func for presenter -> interactor

}

// MARK: DataManager
// Manage services to knows about entity
protocol SearchDataManagerProtocol: class {

}