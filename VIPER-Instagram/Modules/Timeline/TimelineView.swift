//
//  TimelineView.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class TimelineView: UIViewController, TimelineViewProtocol {

    var presenter: TimelinePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

// MARK: Presenter -> View
extension TimelineView: TimelinePresenterDelegate {
    func presenterDidLoad() {

    }
    
}
