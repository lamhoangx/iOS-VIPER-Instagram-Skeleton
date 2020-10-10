//
//  UserProfilePresenter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation

class UserProfilePresenter: UserProfilePresenterProtocol {
    
    weak var view: (UserProfileViewProtocol & UserProfilePresenterDelegate)?
    var router: UserProfileRouterProtocol?
    var interactor: UserProfileInteractorProtocol?
        
    func viewDidLoad() {
        // Presenter do something 

        // Done
        view?.presenterDidLoad()
    }
}

// MARK: Interactor -> Presenter
extension UserProfilePresenter: UserProfileInteractorDelegate {
}
