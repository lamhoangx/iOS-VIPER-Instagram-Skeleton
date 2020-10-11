//
//  PostFeedView.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class PostFeedView: UIViewController, PostFeedViewProtocol {
    
    var presenter: PostFeedPresenterProtocol?
    var activityIndicator: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
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
        let closeLeftItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(closeButtonSelected))
        navigationItem.leftBarButtonItems = [closeLeftItem, UIBarButtonItem(customView: createLeftLabel())]
    }
    
    private func createLeftLabel() -> UILabel {
        let labelSearch = UILabel(
            frame: CGRect(
                x: 0,
                y: 0,
                width: navigationController?.navigationBar.frame.width ?? 0,
                height: navigationController?.navigationBar.frame.height ?? 0)
        )
        labelSearch.text = "Gallery ▼"
        labelSearch.textColor = .gray
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(postFeedGallerySelected))
        labelSearch.isUserInteractionEnabled = true
        labelSearch.addGestureRecognizer(tap)
        
        return labelSearch
    }
    
    @objc func closeButtonSelected() {
        print("closeButtonSelected")
        self.dismiss(animated: true, completion: nil)
    }
    @objc func postFeedGallerySelected() {
        print("postFeedGallerySelected")
    }
}

// MARK: Presenter -> View
extension PostFeedView: PostFeedPresenterDelegate {
    func presenterDidLoad() {
        
    }
    
}
