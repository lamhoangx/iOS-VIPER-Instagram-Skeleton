//
//  NotificationView.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class NotificationView: UIViewController, NotificationViewProtocol {

    var presenter: NotificationPresenterProtocol?
    var activityIndicator: UIActivityIndicatorView?

    override func viewDidLoad() {
        super.viewDidLoad()
                
        presenter?.viewDidLoad()
        activityIndicator = ViewUtils.requestIndicatorLoading(target: view)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
//        if let indicator = activityIndicator {
//            indicator.stopAnimating()
//            indicator.removeFromSuperview()
//        }
//        activityIndicator = nil
    }
}

// MARK: Presenter -> View
extension NotificationView: NotificationPresenterDelegate {
    func presenterDidLoad() {

    }
    
}
