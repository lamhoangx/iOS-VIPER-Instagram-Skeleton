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
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
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
