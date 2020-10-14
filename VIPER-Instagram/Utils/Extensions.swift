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
    
    // Comparibility
    // -1: lessThanOrEqualTo
    //  0: equalTo - default
    //  1: greaterThanOrEqualTo
    private(set) var comparibility: Int = 0
    
    init(equalToConstant constant: CGFloat) {
        self.constant = constant
        self.comparibility = 0
    }
    init(greaterThanOrEqualToConstant constant: CGFloat) {
        self.constant = constant
        self.comparibility = 1
    }
    init(lessThanOrEqualToConstant constant: CGFloat) {
        self.constant = constant
        self.comparibility = -1
    }
    init(equalTo axisAnchor: LayoutAnchorType, constant: CGFloat = 0) {
        self.layoutAnchor = axisAnchor
        self.constant = constant
        self.comparibility = 0
    }
    init(greaterThanOrEqualTo axisAnchor: LayoutAnchorType, constant: CGFloat = 0) {
        self.layoutAnchor = axisAnchor
        self.constant = constant
        self.comparibility = 1
    }
    init(lessThanOrEqualTo axisAnchor: LayoutAnchorType, constant: CGFloat = 0) {
        self.layoutAnchor = axisAnchor
        self.constant = constant
        self.comparibility = -1
    }
}

extension NSLayoutYAxisAnchor {
    func constraint(anchor: LayoutAnchor<NSLayoutYAxisAnchor>) {
        if let layoutAnchor = anchor.layoutAnchor {
        switch anchor.comparibility {
            case -1:
                constraint(lessThanOrEqualTo: layoutAnchor, constant: anchor.constant).isActive = true
                break
            case 0:
                constraint(equalTo: layoutAnchor, constant: anchor.constant).isActive = true
                break
            case 1:
                constraint(greaterThanOrEqualTo: layoutAnchor, constant: anchor.constant).isActive = true
                break
            default:
                break
            }
        }
    }
}

extension NSLayoutXAxisAnchor {
    func constraint(anchor: LayoutAnchor<NSLayoutXAxisAnchor>) {
        if let layoutAnchor = anchor.layoutAnchor {
            switch anchor.comparibility {
            case -1:
                constraint(lessThanOrEqualTo: layoutAnchor, constant: anchor.constant).isActive = true
                break
            case 0:
                constraint(equalTo: layoutAnchor, constant: anchor.constant).isActive = true
                break
            case 1:
                constraint(greaterThanOrEqualTo: layoutAnchor, constant: anchor.constant).isActive = true
                break
            default:
                break
            }
        }
    }
}

extension NSLayoutDimension {
    func constraint(anchor: LayoutAnchor<NSLayoutDimension>) {
        if let layoutAnchor = anchor.layoutAnchor {
            switch anchor.comparibility {
                case -1:
                    constraint(lessThanOrEqualTo: layoutAnchor, constant: anchor.constant).isActive = true
                    break
                case 0:
                    constraint(equalTo: layoutAnchor, constant: anchor.constant).isActive = true
                    break
                case 1:
                    constraint(greaterThanOrEqualTo: layoutAnchor, constant: anchor.constant).isActive = true
                    break
                default:
                    break
            }
        } else {
            switch anchor.comparibility {
                case -1:
                    constraint(lessThanOrEqualToConstant: anchor.constant).isActive = true
                    break
                case 0:
                    constraint(equalToConstant: anchor.constant).isActive = true
                    break
                case 1:
                    constraint(greaterThanOrEqualToConstant: anchor.constant).isActive = true
                    break
                default:
                    break
            }
        }
        
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
        if let left = left, let _ = left.layoutAnchor {
            leftAnchor.constraint(anchor: left)
        }
        if let top = top, let _ = top.layoutAnchor {
            topAnchor.constraint(anchor: top)
        }
        if var right = right, let _ = right.layoutAnchor {
            right.constant = -right.constant
            rightAnchor.constraint(anchor: right)
        }
        if var bottom = bottom, let _ = bottom.layoutAnchor {
            bottom.constant = -bottom.constant
            bottomAnchor.constraint(anchor: bottom)
        }
        if let centerX = centerX, let _ = centerX.layoutAnchor {
            centerXAnchor.constraint(anchor: centerX)
        }
        if let centerY = centerY, let _ = centerY.layoutAnchor {
            centerYAnchor.constraint(anchor: centerY)
        }
        if let width = width {
            widthAnchor.constraint(anchor: width)
        }
        if let height = height {
            heightAnchor.constraint(anchor: height)
        }
    }
}
