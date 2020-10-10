//
//  LoginProtocol.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

// MARK: Router
protocol LoginRouterProtocol: class {
    static func buildLoginView() -> UIViewController?

    // func for redirect

}

// MARK: View
protocol LoginViewProtocol: class {
    var presenter: LoginPresenterProtocol? { get set }

}
// Extends by view to receive notifies from presenter
protocol LoginPresenterDelegate: class {
    //func for presenter -> view
    func presenterDidLoad()
}

// MARK: Presenter
protocol LoginPresenterProtocol: class {
    var router: LoginRouterProtocol? { get set }
    var view: (LoginViewProtocol & LoginPresenterDelegate)? { get set }
    var interactor: LoginInteractorProtocol? { get set }

    // func for presenter -> interactor
    func viewDidLoad()

}
// Extends by presenter to receive notifies from interactor
protocol LoginInteractorDelegate: class {
    //func for interactor -> presenter

}

// MARK: Interactor
protocol LoginInteractorProtocol: class {
    var presenter: LoginInteractorDelegate? { get set }
    var dataManager: LoginDataManagerProtocol? { get set }

    // func for presenter -> interactor

}

// MARK: DataManager
// Manage services to knows about entity
protocol LoginDataManagerProtocol: class {

}