//
//  PostFeedProtocol.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

// Delegate
protocol PostFeedDelegate: class {
    func feedDidPost(_ feed: FeedViewModel)
}

// MARK: Router
protocol PostFeedRouterProtocol: class {
    static func buildPostFeedView() -> UIViewController?

    // func for redirect
    func dismiss(from viewController: UIViewController, completion: (() -> Void)?)
}

// MARK: View
protocol PostFeedViewProtocol: class {
    var presenter: PostFeedPresenterProtocol? { get set }

}
// Extends by view to receive notifies from presenter
protocol PostFeedPresenterDelegate: class {
    //func for presenter -> view
    func presenterDidLoad()
}

// MARK: Presenter
protocol PostFeedPresenterProtocol: class {
    var router: PostFeedRouterProtocol? { get set }
    var view: (PostFeedViewProtocol & PostFeedPresenterDelegate)? { get set }
    var interactor: PostFeedInteractorProtocol? { get set }

    // func for presenter -> interactor
    func viewDidLoad()

}
// Extends by presenter to receive notifies from interactor
protocol PostFeedInteractorDelegate: class {
    //func for interactor -> presenter
    
}

// MARK: Interactor
protocol PostFeedInteractorProtocol: class {
    var presenter: PostFeedInteractorDelegate? { get set }
    var dataManager: PostFeedDataManagerProtocol? { get set }

    // func for presenter -> interactor

}

// MARK: DataManager
// Manage services to knows about entity
protocol PostFeedDataManagerProtocol: class {

}
