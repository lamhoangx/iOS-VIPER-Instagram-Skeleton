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
        setupNavigationBar()
            
        self.collectionView.register(FeedCollectionViewCell.self, forCellWithReuseIdentifier: feedCellIdentifer)
        showUILazyLoading()
        
        presenter?.viewDidLoad()
        
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
        presenter?.refresh()
    }

    // MARK: - UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.getFeedCount() ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: feedCellIdentifer, for: indexPath) as! FeedCollectionViewCell
        if let presenter = presenter {
            cell.bindFeedViewModel(indentifier: indexPath, feedViewModel: presenter.getFeed(at: indexPath), delegate: self)
        }
        return cell
    }
}

// MARK: Presenter -> View
extension FeedView: FeedPresenterDelegate {
    func reloadData() {
        collectionView?.reloadData()
        endRefreshControl()
    }
    
    func feedDidPost(_ feedViewModel: FeedViewModel) {
        collectionView?.reloadData()
    }
    
    func presenterDidLoad() {
        dismissUILazyLoading()
    }
}

// FeedCellDelegate
extension FeedView: FeedCellDelegate {
    func userInfoFeedOwnerTapped(feedIndentifier: IndexPath) {
        presenter?.openUserProfile(feedIndentifier: feedIndentifier)
    }
    
    func optionsButtonTapped(feedIndentifier: IndexPath) {
        
    }
    
    func likeFeedButtonTapped(feedIndentifier: IndexPath) {
        presenter?.fireLikeFeedAction(feedIndentifier: feedIndentifier)
    }
    
    func commentFeedButtonTapped(feedIndentifier: IndexPath) {
        presenter?.openComments(feedIndentifier: feedIndentifier)
    }
    
    func sentFeedButtonTapped(feedIndentifier: IndexPath) {
        presenter?.forwardFeed(feedIndentifier: feedIndentifier)
    }
    
    func bookmarkFeedButtonTapped(feedIndentifier: IndexPath) {
        presenter?.fireBookmarkFeedAction(feedIndentifier: feedIndentifier)
    }
    
    func numLikesFeedInfoTapped(feedIndentifier: IndexPath) {
        
    }
    
}
