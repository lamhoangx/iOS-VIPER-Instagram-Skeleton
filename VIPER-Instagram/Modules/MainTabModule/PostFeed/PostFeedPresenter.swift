//
//  PostFeedPresenter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation

class PostFeedPresenter: PostFeedPresenterProtocol {
    
    weak var view: (PostFeedViewProtocol & PostFeedPresenterDelegate)?
    var router: PostFeedRouterProtocol?
    var interactor: PostFeedInteractorProtocol?
        
    func viewDidLoad() {
        // Presenter do something 

        // Done
        view?.presenterDidLoad()
    }
}

// MARK: Interactor -> Presenter
extension PostFeedPresenter: PostFeedInteractorDelegate {
}
