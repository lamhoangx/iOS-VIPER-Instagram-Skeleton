//
//  NotificationPresenter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation

class NotificationPresenter: NotificationPresenterProtocol {
    
    weak var view: (NotificationViewProtocol & NotificationPresenterDelegate)?
    var router: NotificationRouterProtocol?
    var interactor: NotificationInteractorProtocol?
        
    func viewDidLoad() {
        // Presenter do something 

        // Done
        view?.presenterDidLoad()
    }
}

// MARK: Interactor -> Presenter
extension NotificationPresenter: NotificationInteractorDelegate {
}
