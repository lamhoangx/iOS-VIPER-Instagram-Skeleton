//
//  FeedProtocol.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

// MARK: Router
protocol FeedRouterProtocol: class {
    static func buildFeedView() -> UIViewController?

    // func for redirect

}

// MARK: View
protocol FeedViewProtocol: class {
    var presenter: FeedPresenterProtocol? { get set }

}
// Extends by view to receive notifies from presenter
protocol FeedPresenterDelegate: class {
    //func for presenter -> view
    func presenterDidLoad()
}

// MARK: Presenter
protocol FeedPresenterProtocol: class {
    var router: FeedRouterProtocol? { get set }
    var view: (FeedViewProtocol & FeedPresenterDelegate)? { get set }
    var interactor: FeedInteractorProtocol? { get set }

    // func for presenter -> interactor
    func viewDidLoad()

}
// Extends by presenter to receive notifies from interactor
protocol FeedInteractorDelegate: class {
    //func for interactor -> presenter

}

// MARK: Interactor
protocol FeedInteractorProtocol: class {
    var presenter: FeedInteractorDelegate? { get set }
    var dataManager: FeedDataManagerProtocol? { get set }

    // func for presenter -> interactor

}

// MARK: DataManager
// Manage services to knows about entity
protocol FeedDataManagerProtocol: class {

}