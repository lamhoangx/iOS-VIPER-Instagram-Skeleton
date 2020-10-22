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
    var priority: Float = 1000
    
    // Comparibility
    // -1: lessThanOrEqualTo
    //  0: equalTo - default
    //  1: greaterThanOrEqualTo
    private(set) var comparibility: Int = 0
    
    init(equalToConstant constant: CGFloat, priority: Float = 1000) {
        self.constant = constant
        self.comparibility = 0
        self.priority = priority
    }
    init(greaterThanOrEqualToConstant constant: CGFloat, priority: Float = 1000) {
        self.constant = constant
        self.comparibility = 1
        self.priority = priority
    }
    init(lessThanOrEqualToConstant constant: CGFloat, priority: Float = 1000) {
        self.constant = constant
        self.comparibility = -1
        self.priority = priority
    }
    init(equalTo axisAnchor: LayoutAnchorType, constant: CGFloat = 0, priority: Float = 1000) {
        self.layoutAnchor = axisAnchor
        self.constant = constant
        self.comparibility = 0
        self.priority = priority
    }
    init(greaterThanOrEqualTo axisAnchor: LayoutAnchorType, constant: CGFloat = 0, priority: Float = 1000) {
        self.layoutAnchor = axisAnchor
        self.constant = constant
        self.comparibility = 1
        self.priority = priority
    }
    init(lessThanOrEqualTo axisAnchor: LayoutAnchorType, constant: CGFloat = 0, priority: Float = 1000) {
        self.layoutAnchor = axisAnchor
        self.constant = constant
        self.comparibility = -1
        self.priority = priority
    }
}

extension NSLayoutYAxisAnchor {
    func constraint(anchor: LayoutAnchor<NSLayoutYAxisAnchor>) -> NSLayoutConstraint? {
        var layoutContraint: NSLayoutConstraint?
        if let layoutAnchor = anchor.layoutAnchor {
        switch anchor.comparibility {
            case -1:
                layoutContraint = constraint(lessThanOrEqualTo: layoutAnchor, constant: anchor.constant)
                break
            case 0:
                layoutContraint = constraint(equalTo: layoutAnchor, constant: anchor.constant)
                break
            case 1:
                layoutContraint = constraint(greaterThanOrEqualTo: layoutAnchor, constant: anchor.constant)
                break
            default:
                break
            }
        }
        if let result = layoutContraint {
            result.isActive = true
            return result
        }
        return nil
    }
}

extension NSLayoutXAxisAnchor {
    func constraint(anchor: LayoutAnchor<NSLayoutXAxisAnchor>) -> NSLayoutConstraint? {
        var layoutContraint: NSLayoutConstraint?
        if let layoutAnchor = anchor.layoutAnchor {
            switch anchor.comparibility {
            case -1:
                layoutContraint = constraint(lessThanOrEqualTo: layoutAnchor, constant: anchor.constant)
                break
            case 0:
                layoutContraint = constraint(equalTo: layoutAnchor, constant: anchor.constant)
                break
            case 1:
                layoutContraint = constraint(greaterThanOrEqualTo: layoutAnchor, constant: anchor.constant)
                break
            default:
                break
            }
        }
        if let result = layoutContraint {
            result.isActive = true
            return result
        }
        return nil
    }
}

extension NSLayoutDimension {
    func constraint(anchor: LayoutAnchor<NSLayoutDimension>) -> NSLayoutConstraint? {
        var layoutContraint: NSLayoutConstraint?
        if let layoutAnchor = anchor.layoutAnchor {
            switch anchor.comparibility {
                case -1:
                    layoutContraint = constraint(lessThanOrEqualTo: layoutAnchor, constant: anchor.constant)
                    break
                case 0:
                    layoutContraint = constraint(equalTo: layoutAnchor, constant: anchor.constant)
                    break
                case 1:
                    layoutContraint = constraint(greaterThanOrEqualTo: layoutAnchor, constant: anchor.constant)
                    break
                default:
                    break
            }
        } else {
            switch anchor.comparibility {
                case -1:
                    layoutContraint = constraint(lessThanOrEqualToConstant: anchor.constant)
                    break
                case 0:
                    layoutContraint = constraint(equalToConstant: anchor.constant)
                    break
                case 1:
                    layoutContraint = constraint(greaterThanOrEqualToConstant: anchor.constant)
                    break
                default:
                    break
            }
        }
        if let result = layoutContraint {
            result.isActive = true
            return result
        }
        return nil
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
            let layoutContraint = leftAnchor.constraint(anchor: left)
            if left.priority != 1000 {
                layoutContraint?.priority = UILayoutPriority(left.priority)
            }
        }
        if let top = top, let _ = top.layoutAnchor {
            let layoutContraint = topAnchor.constraint(anchor: top)
            if top.priority != 1000 {
                layoutContraint?.priority = UILayoutPriority(top.priority)
            }
        }
        if var right = right, let _ = right.layoutAnchor {
            right.constant = -right.constant
            let layoutContraint = rightAnchor.constraint(anchor: right)
            if right.priority != 1000 {
                layoutContraint?.priority = UILayoutPriority(right.priority)
            }
        }
        if var bottom = bottom, let _ = bottom.layoutAnchor {
            bottom.constant = -bottom.constant
            let layoutContraint = bottomAnchor.constraint(anchor: bottom)
            if bottom.priority != 1000 {
                layoutContraint?.priority = UILayoutPriority(bottom.priority)
            }
        }
        if let centerX = centerX, let _ = centerX.layoutAnchor {
            let layoutContraint = centerXAnchor.constraint(anchor: centerX)
            if centerX.priority != 1000 {
                layoutContraint?.priority = UILayoutPriority(centerX.priority)
            }
        }
        if let centerY = centerY, let _ = centerY.layoutAnchor {
            let layoutContraint = centerYAnchor.constraint(anchor: centerY)
            if centerY.priority != 1000 {
                layoutContraint?.priority = UILayoutPriority(centerY.priority)
            }
        }
        if let width = width {
            let layoutContraint = widthAnchor.constraint(anchor: width)
            if width.priority != 1000 {
                layoutContraint?.priority = UILayoutPriority(width.priority)
            }
        }
        if let height = height {
            let layoutContraint = heightAnchor.constraint(anchor: height)
            if height.priority != 1000 {
                layoutContraint?.priority = UILayoutPriority(height.priority)
            }
        }
    }
}

extension Dictionary {
    subscript(i:Int) -> (key:Key,value:Value) {
        get {
            return self[index(startIndex, offsetBy: i)];
        }
    }
}
