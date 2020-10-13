//
//  Extensions.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/10/20.
//

import Foundation
import UIKit


struct LayoutAnchor<LayoutAnchorType> {
    var layoutAnchor: LayoutAnchorType?
    var constant: CGFloat = 0
    
    init(constant: CGFloat) {
        // selft.layoutAnchor = self.NSLayoutAnchor
        self.constant = constant
    }
    
    init(equalTo axisAnchor: LayoutAnchorType?, constant: CGFloat = 0) {
        self.layoutAnchor = axisAnchor
        self.constant = constant
    }
}

extension UIView {
    func anchor(
        left: LayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        top: LayoutAnchor<NSLayoutYAxisAnchor>? = nil,
        right: LayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        bottom: LayoutAnchor<NSLayoutYAxisAnchor>? = nil,
        centerX: LayoutAnchor<NSLayoutXAxisAnchor>? = nil,
        centerY: LayoutAnchor<NSLayoutYAxisAnchor>? = nil,
        width: LayoutAnchor<NSLayoutDimension>? = nil,
        height: LayoutAnchor<NSLayoutDimension>? = nil
    ){
        translatesAutoresizingMaskIntoConstraints = false
        if let left = left, let layoutAnchor = left.layoutAnchor {
            leftAnchor.constraint(equalTo: layoutAnchor, constant: left.constant).isActive = true
        }
        if let top = top, let layoutAnchor = top.layoutAnchor {
            topAnchor.constraint(equalTo: layoutAnchor, constant: top.constant).isActive = true
        }
        if let right = right, let layoutAnchor = right.layoutAnchor {
            rightAnchor.constraint(equalTo: layoutAnchor, constant: -right.constant).isActive = true
        }
        if let bottom = bottom, let layoutAnchor = bottom.layoutAnchor {
            bottomAnchor.constraint(equalTo: layoutAnchor, constant: -bottom.constant).isActive = true
        }
        if let centerX = centerX, let layoutAnchor = centerX.layoutAnchor {
            centerXAnchor.constraint(equalTo: layoutAnchor, constant: centerX.constant).isActive = true
        }
        if let centerY = centerY, let layoutAnchor = centerY.layoutAnchor {
            centerYAnchor.constraint(equalTo: layoutAnchor, constant: centerY.constant).isActive = true
        }
        if let width = width {
            if let layoutAnchor = width.layoutAnchor {
                widthAnchor.constraint(equalTo: layoutAnchor, constant: width.constant).isActive = true
            } else {
                widthAnchor.constraint(equalToConstant: width.constant).isActive = true
            }
        }
        if let height = height {
            if let layoutAnchor = height.layoutAnchor {
                heightAnchor.constraint(equalTo: layoutAnchor, constant: height.constant).isActive = true
            } else {
                heightAnchor.constraint(equalToConstant: height.constant).isActive = true
            }
        }
    }
}
