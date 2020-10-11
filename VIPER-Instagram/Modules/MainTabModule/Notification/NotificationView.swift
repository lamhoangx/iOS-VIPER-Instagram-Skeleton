//
//  NotificationView.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class NotificationView: UIRefreshableController, NotificationViewProtocol {    

    var presenter: NotificationPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        presenter?.viewDidLoad()
        
        showUILazyLoading()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        dismissUILazyLoading()
    }
    
    private func setupNavigationBar() {
        let leftTitle = UIBarButtonItem(customView: createTitleLabel())
        navigationItem.leftBarButtonItem = leftTitle
    }
    
    override func handleActionRefreshControl() {
        
        endRefreshControl()
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
        return label
    }
}

// MARK: Presenter -> View
extension NotificationView: NotificationPresenterDelegate {
    func presenterDidLoad() {

    }
    
}
