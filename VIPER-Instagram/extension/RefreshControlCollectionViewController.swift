//
//  RefreshControlCollectionViewController.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/12/20.
//

import Foundation
import UIKit

class UIRefreshableController: UICollectionViewController {
    var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureRefreshControl()
    }
    
    func endRefreshControl() {
        self.collectionView?.refreshControl?.endRefreshing()
    }
    
    func configureRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        collectionView?.refreshControl = refreshControl
    }
    
    @objc func handleRefresh() {
        
    }
    
    func startUILazyLoading() {
        activityIndicator = ViewUtils.requestIndicatorLoading(target: view)
    }
    
    func dismissUILazyLoading() {
        if let indicator = activityIndicator {
            indicator.stopAnimating()
            indicator.removeFromSuperview()
        }
        activityIndicator = nil
    }
}
