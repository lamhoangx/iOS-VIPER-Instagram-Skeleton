//
//  FeedView.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class FeedView: UIViewController, FeedViewProtocol {

    var presenter: FeedPresenterProtocol?
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
        let cameraLeftBarButtton = UIBarButtonItem(image: #imageLiteral(resourceName: "camera"), style: .plain, target: self, action: #selector(cameraLeftBarButtonSelected))
        let logoLeftBarButton = UIBarButtonItem(customView: UIImageView(image: #imageLiteral(resourceName: "instagram_logo")))
        
        navigationItem.leftBarButtonItems = [
            cameraLeftBarButtton,
            logoLeftBarButton
        ]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "send_tabbar_icon"), style: .plain, target: self, action: #selector(messageSelected))
    }
    
    @objc func cameraLeftBarButtonSelected() {
        print("cameraLeftBarButtonSelected")
    }
    @objc func messageSelected() {
        print("messageSelected")
    }
}

// MARK: Presenter -> View
extension FeedView: FeedPresenterDelegate {
    func presenterDidLoad() {

    }
    
}
