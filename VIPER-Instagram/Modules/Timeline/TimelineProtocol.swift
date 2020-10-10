//
//  TimelineProtocol.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

// MARK: Router
protocol TimelineRouterProtocol: class {
    static func buildTimelineView() -> UIViewController?

    // func for redirect

}

// MARK: View
protocol TimelineViewProtocol: class {
    var presenter: TimelinePresenterProtocol? { get set }

}
// Extends by view to receive notifies from presenter
protocol TimelinePresenterDelegate: class {
    //func for presenter -> view
    func presenterDidLoad()
}

// MARK: Presenter
protocol TimelinePresenterProtocol: class {
    var router: TimelineRouterProtocol? { get set }
    var view: (TimelineViewProtocol & TimelinePresenterDelegate)? { get set }
    var interactor: TimelineInteractorProtocol? { get set }

    // func for presenter -> interactor
    func viewDidLoad()

}
// Extends by presenter to receive notifies from interactor
protocol TimelineInteractorDelegate: class {
    //func for interactor -> presenter

}

// MARK: Interactor
protocol TimelineInteractorProtocol: class {
    var presenter: TimelineInteractorDelegate? { get set }
    var dataManager: TimelineDataManagerProtocol? { get set }

    // func for presenter -> interactor

}

// MARK: DataManager
// Manage services to knows about entity
protocol TimelineDataManagerProtocol: class {

}