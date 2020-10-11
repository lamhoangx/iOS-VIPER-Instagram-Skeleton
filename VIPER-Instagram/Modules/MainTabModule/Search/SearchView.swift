//
//  SearchView.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class SearchView: UIRefreshableController, SearchViewProtocol {

    var presenter: SearchPresenterProtocol?

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
        let searchLeftBarButtton = UIBarButtonItem(image: #imageLiteral(resourceName: "Search"), style: .plain, target: self, action: #selector(searchLeftBarButtonSelected))
        let leftTitle = UIBarButtonItem(customView: createLabelSearch())
        navigationItem.leftBarButtonItems = [searchLeftBarButtton, leftTitle]
    }
    
    @objc func searchLeftBarButtonSelected() {
        print("searchLeftBarButtonSelected")
    }
    
    override func handleActionRefreshControl() {
        endRefreshControl()
    }
    
    private func createLabelSearch() -> UILabel {
        let labelSearch = UILabel(
            frame: CGRect(
                x: 0,
                y: 0,
                width: navigationController?.navigationBar.frame.width ?? 0,
                height: navigationController?.navigationBar.frame.height ?? 0)
        )
        labelSearch.text = "Search"
        labelSearch.textColor = .gray

        let tap = UITapGestureRecognizer(target: self, action: #selector(searchLeftBarButtonSelected))
        labelSearch.isUserInteractionEnabled = true
        labelSearch.addGestureRecognizer(tap)
        
        return labelSearch
    }
    
}

// MARK: Presenter -> View
extension SearchView: SearchPresenterDelegate {
    func presenterDidLoad() {

    }
    
}
