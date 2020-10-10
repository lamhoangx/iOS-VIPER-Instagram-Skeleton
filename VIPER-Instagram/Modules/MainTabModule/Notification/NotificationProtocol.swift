//
//  NotificationProtocol.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

// MARK: Router
protocol NotificationRouterProtocol: class {
    static func buildNotificationView() -> UIViewController?

    // func for redirect

}

// MARK: View
protocol NotificationViewProtocol: class {
    var presenter: NotificationPresenterProtocol? { get set }

}
// Extends by view to receive notifies from presenter
protocol NotificationPresenterDelegate: class {
    //func for presenter -> view
    func presenterDidLoad()
}

// MARK: Presenter
protocol NotificationPresenterProtocol: class {
    var router: NotificationRouterProtocol? { get set }
    var view: (NotificationViewProtocol & NotificationPresenterDelegate)? { get set }
    var interactor: NotificationInteractorProtocol? { get set }

    // func for presenter -> interactor
    func viewDidLoad()

}
// Extends by presenter to receive notifies from interactor
protocol NotificationInteractorDelegate: class {
    //func for interactor -> presenter

}

// MARK: Interactor
protocol NotificationInteractorProtocol: class {
    var presenter: NotificationInteractorDelegate? { get set }
    var dataManager: NotificationDataManagerProtocol? { get set }

    // func for presenter -> interactor

}

// MARK: DataManager
// Manage services to knows about entity
protocol NotificationDataManagerProtocol: class {

}