//
//  RefreshControlCollectionViewController.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/12/20.
//

import Foundation
import UIKit

// MARK: Support RefreshControl & UI lazy loading
class UIRefreshableController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    init() {
        let flowLayout = FeedCollectionViewFlowLayout()
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        super.init(collectionViewLayout: flowLayout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = .white
        configureRefreshControl()
    }
    
    
    func configureRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleActionRefreshControl), for: .valueChanged)
        collectionView?.refreshControl = refreshControl
    }
    
    func endRefreshControl() {
        self.collectionView?.refreshControl?.endRefreshing()
    }
    
    func disableRefreshControl() {
        collectionView?.refreshControl = nil
    }
    
    @objc func handleActionRefreshControl() {
        
    }
    
    func showUILazyLoading() {
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
