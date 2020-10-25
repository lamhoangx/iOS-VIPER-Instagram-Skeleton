//
//  UserProfileView.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

private let userInfoIdenfitier = "user-info-header"
class UserProfileView: UIRefreshableController, UserProfileViewProtocol {

    var presenter: UserProfilePresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        
        //
        collectionView!.register(UserInfoCollectionViewCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: userInfoIdenfitier)
        
        
        presenter?.viewDidLoad()
    }
    
    private func setupNavigationBar() {
        let closeLeftItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(actionLeftBarItemTapped))
        let usename = UIBarButtonItem(title: getUserName(), style: .plain, target: self, action: #selector(actionUserNameTapped))
        let more = UIBarButtonItem(image: #imageLiteral(resourceName: "more"), style: UIBarButtonItem.Style.plain, target: self, action: #selector(actionMoreItemTapped))
        navigationItem.leftBarButtonItems = [closeLeftItem, usename]
        navigationItem.rightBarButtonItem = more
    }
    
    private func getUserName() -> String {
        return "Username ▿"
    }
    
    @objc func actionLeftBarItemTapped() {}
    @objc func actionMoreItemTapped() {}
    @objc func actionUserNameTapped() {}
    
    override func handleActionRefreshControl() {
        endRefreshControl()
    }
}

// Collection View
extension UserProfileView {
    // MARK: - UICollectionViewFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        // Get the view for the first header
        let indexPath = IndexPath(row: 0, section: section)
        let headerView = self.collectionView(collectionView, viewForSupplementaryElementOfKind: UICollectionView.elementKindSectionHeader, at: indexPath)
        
        // Use this view to calculate the optimal size based on the collection view's width
        return headerView.systemLayoutSizeFitting(
            CGSize(width: collectionView.frame.width, height: UIView.layoutFittingExpandedSize.height),
            withHorizontalFittingPriority: .required, // Width is fixed
            verticalFittingPriority: .fittingSizeLevel) // Height can be as large as needed
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        // Fetch More
    }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: userInfoIdenfitier, for: indexPath) as! UserInfoCollectionViewCell
            return header
        }
        fatalError()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
}

// MARK: Presenter -> View
extension UserProfileView: UserProfilePresenterDelegate {
    func presenterDidLoad() {

    }
    
}
