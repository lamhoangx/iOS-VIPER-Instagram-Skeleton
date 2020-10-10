//
//  UserProfileProtocol.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

// MARK: Router
protocol UserProfileRouterProtocol: class {
    static func buildUserProfileView() -> UIViewController?

    // func for redirect

}

// MARK: View
protocol UserProfileViewProtocol: class {
    var presenter: UserProfilePresenterProtocol? { get set }

}
// Extends by view to receive notifies from presenter
protocol UserProfilePresenterDelegate: class {
    //func for presenter -> view
    func presenterDidLoad()
}

// MARK: Presenter
protocol UserProfilePresenterProtocol: class {
    var router: UserProfileRouterProtocol? { get set }
    var view: (UserProfileViewProtocol & UserProfilePresenterDelegate)? { get set }
    var interactor: UserProfileInteractorProtocol? { get set }

    // func for presenter -> interactor
    func viewDidLoad()

}
// Extends by presenter to receive notifies from interactor
protocol UserProfileInteractorDelegate: class {
    //func for interactor -> presenter

}

// MARK: Interactor
protocol UserProfileInteractorProtocol: class {
    var presenter: UserProfileInteractorDelegate? { get set }
    var dataManager: UserProfileDataManagerProtocol? { get set }

    // func for presenter -> interactor

}

// MARK: DataManager
// Manage services to knows about entity
protocol UserProfileDataManagerProtocol: class {

}