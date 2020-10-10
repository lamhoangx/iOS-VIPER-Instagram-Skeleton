//
//  LoginView.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class LoginView: UIViewController, LoginViewProtocol {

    var presenter: LoginPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

// MARK: Presenter -> View
extension LoginView: LoginPresenterDelegate {
    func presenterDidLoad() {

    }
    
}
