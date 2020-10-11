//
//  MainTabView.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class MainTabView: UITabBarController, UITabBarControllerDelegate, MainTabViewProtocol {

    var presenter: MainTabPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        self.delegate = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        presenter?.prepare()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let presenter = presenter {
            return presenter.shouldTabSelect(viewNavController: viewController as! UINavigationController)
        }
        return true
    }
}

// MARK: Presenter -> View
extension MainTabView: MainTabPresenterDelegate {
    func presenterDidLoad() {
    }
    func tabsControllerDidLoad(_ controllers: [UINavigationController]) {
        viewControllers = controllers
        // tab bar tint color
        tabBar.tintColor = .black
    }
}
