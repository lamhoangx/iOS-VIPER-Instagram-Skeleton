//
//  ComponentUtil.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/25/20.
//

import Foundation
import UIKit

class ComponentUtil {
    public static let interfaceButtonSize: CGFloat = 40
    public static let paddingEdge: CGFloat = 12
    public static let paddingElement: CGFloat = 8
    public static let feedImageContentHeight: CGFloat = 300
    public static let captionTest = ""
    
    // Helper
    static func newAspectFillImageView() -> UIImageView {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.isUserInteractionEnabled = true
        return iv
    }
    
    // Return Button with height = 40 - $interfaceInteractSize
    static func newBoldLabelButton(text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.anchor(
            height: LayoutAnchor(equalToConstant: interfaceButtonSize, priority: 999)
        )
        return button
    }
    
    // CGSize(40, 40). See at $interfaceInteractSize
    static func newButton() -> UIButton {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.contentMode = .center
        button.imageView?.contentMode = .scaleAspectFit
        button.imageEdgeInsets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        button.anchor(
            width: LayoutAnchor(equalToConstant: interfaceButtonSize, priority: 999),
            height: LayoutAnchor(equalToConstant: interfaceButtonSize, priority: 999))
        return button
    }
    
    class UILabelLayered : UIView {
        let aboveLabel = UILabel()
        let underLable = UILabel()
        
        func setText(aboveText: String, underText: String) -> UILabelLayered {
            aboveLabel.text = aboveText
            underLable.text = underText
            
            return self
        }
        
        
    }
}
