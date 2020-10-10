//
//  SearchView.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class SearchView: UIViewController, SearchViewProtocol {

    var presenter: SearchPresenterProtocol?

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
extension SearchView: SearchPresenterDelegate {
    func presenterDidLoad() {

    }
    
}
