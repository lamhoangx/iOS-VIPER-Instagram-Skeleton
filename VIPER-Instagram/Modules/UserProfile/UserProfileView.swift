//
//  UserProfileView.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class UserProfileView: UIViewController, UserProfileViewProtocol {

    var presenter: UserProfilePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

// MARK: Presenter -> View
extension UserProfileView: UserProfilePresenterDelegate {
    func presenterDidLoad() {

    }
    
}
