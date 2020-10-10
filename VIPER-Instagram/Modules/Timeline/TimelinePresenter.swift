//
//  TimelinePresenter.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation

class TimelinePresenter: TimelinePresenterProtocol {
    
    weak var view: (TimelineViewProtocol & TimelinePresenterDelegate)?
    var router: TimelineRouterProtocol?
    var interactor: TimelineInteractorProtocol?
        
    func viewDidLoad() {
        // Presenter do something 

        // Done
        view?.presenterDidLoad()
    }
}

// MARK: Interactor -> Presenter
extension TimelinePresenter: TimelineInteractorDelegate {
}
