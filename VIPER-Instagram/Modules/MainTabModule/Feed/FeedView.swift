//
//  FeedView.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

private let feedCellIdentifer = "FeelViewCell"

class FeedView: UIRefreshableController, UICollectionViewDelegateFlowLayout, FeedViewProtocol {

    var presenter: FeedPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: feedCellIdentifer)
        
        setupNavigationBar()
        presenter?.viewDidLoad()
        
        showUILazyLoading()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        dismissUILazyLoading()
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
    
    @objc override func handleActionRefreshControl() {
        endRefreshControl()
        collectionView?.reloadData()
    }

    // MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedCellIdentifer, for: indexPath) as! FeedCollectionViewCell
        cell.bindFeedViewModel(feedViewModel: FeedViewModel(feedId: CLong(0)))
        return cell
    }
}

// MARK: Presenter -> View
extension FeedView: FeedPresenterDelegate {
    func presenterDidLoad() {

    }
    
}
