//
//  FeedPresenter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation

class FeedPresenter: FeedPresenterProtocol {
    
    weak var view: (FeedViewProtocol & FeedPresenterDelegate)?
    var router: FeedRouterProtocol?
    var interactor: FeedInteractorProtocol?
        
    func viewDidLoad() {
        // Presenter do something 

        // Done
        view?.presenterDidLoad()
    }
}

// MARK: Interactor -> Presenter
extension FeedPresenter: FeedInteractorDelegate {
}
