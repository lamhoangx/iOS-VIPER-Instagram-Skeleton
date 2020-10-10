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
        setupNavigationBar()
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
    
    private func setupNavigationBar() {
        let leftTitle = UIBarButtonItem(customView: createTitleLabel())
        navigationItem.leftBarButtonItem = leftTitle
    }
    
    private func createTitleLabel() -> UILabel {
        let label = UILabel(
            frame: CGRect(
                x: 0,
                y: 0,
                width: navigationController?.navigationBar.frame.width ?? 0,
                height: navigationController?.navigationBar.frame.height ?? 0)
        )
        label.text = "Activity"
        label.font = .boldSystemFont(ofSize: 18)

//        let tap = UITapGestureRecognizer(target: self, action: #selector(searchLeftBarLableSelected))
//        labelSearch.isUserInteractionEnabled = true
//        labelSearch.addGestureRecognizer(tap)
        
        return label
    }
}

// MARK: Presenter -> View
extension NotificationView: NotificationPresenterDelegate {
    func presenterDidLoad() {

    }
    
}
