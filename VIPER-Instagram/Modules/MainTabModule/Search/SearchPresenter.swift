//
//  SearchPresenter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation

class SearchPresenter: SearchPresenterProtocol {
    
    weak var view: (SearchViewProtocol & SearchPresenterDelegate)?
    var router: SearchRouterProtocol?
    var interactor: SearchInteractorProtocol?
        
    func viewDidLoad() {
        // Presenter do something 

        // Done
        view?.presenterDidLoad()
    }
}

// MARK: Interactor -> Presenter
extension SearchPresenter: SearchInteractorDelegate {
}
