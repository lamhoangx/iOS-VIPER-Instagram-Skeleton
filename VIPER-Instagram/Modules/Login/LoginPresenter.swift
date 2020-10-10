//
//  LoginPresenter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation

class LoginPresenter: LoginPresenterProtocol {
    
    weak var view: (LoginViewProtocol & LoginPresenterDelegate)?
    var router: LoginRouterProtocol?
    var interactor: LoginInteractorProtocol?
        
    func viewDidLoad() {
        // Presenter do something 

        // Done
        view?.presenterDidLoad()
    }
}

// MARK: Interactor -> Presenter
extension LoginPresenter: LoginInteractorDelegate {
}
