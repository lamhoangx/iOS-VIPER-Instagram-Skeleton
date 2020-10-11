//
//  ViewUitls.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit

class ViewUtils {
    
    static func requestIndicatorLoading(
        target: UIView
    ) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        
        activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0);
        activityIndicator.center = target.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style =
            UIActivityIndicatorView.Style.large
        activityIndicator.color = .gray
        target.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        
        return activityIndicator
    }
    
    static func createNavController(
        unselectedImage: UIImage,
        selectedImage: UIImage,
        rootViewController: UIViewController?
    ) -> UINavigationController {
        // construct nav controller
        let navController: UINavigationController
        if ((rootViewController) != nil) {
            navController = UINavigationController(rootViewController: rootViewController!)
        } else {
            navController = UINavigationController()
        }
        
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        navController.navigationBar.tintColor = .black
        
        // return nav controller
        return navController
    }
}
