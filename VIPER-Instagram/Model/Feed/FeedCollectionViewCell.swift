//
//  FeedCollectionCellView.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/12/20.
//

import Foundation
import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    
    // Constraint size
    let profileImageSize = CGFloat(40)
    let paddingEdge = CGFloat(12)
    let paddingElement = CGFloat(10)
    
    private var feedViewModel: FeedViewModel?
    
    // Header
    // Image
    let profileImageView: UIImageView = {
        let image = newImageView()
        image.isUserInteractionEnabled = true
        func testFunc(text: String) {
            
        }
        return image
    }()
    // Username
    let userName: UIButton = {
        return getLabelButton(text: "UserName")
    }()
    // Option
    let optionsButton: UIButton = {
        let labelButton = getLabelButton(text: "•••")
        labelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        return labelButton
    }()
    //
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // build UI
        //Header
        configurateHeader()
    }
    
    func bindFeedViewModel(feedViewModel: FeedViewModel) {
        self.feedViewModel = feedViewModel
        // binding data
    }
    
    private func configurateHeader() {
        //Image profile
        addSubview(profileImageView)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(userInfoTapped))
        profileImageView.addGestureRecognizer(tapGestureRecognizer)
        profileImageView.anchor(
            top: topAnchor,
            left: leftAnchor,
            paddingTop: paddingEdge,
            paddingLeft: paddingEdge,
            width: profileImageSize,
            height: profileImageSize
        )
        profileImageView.layer.cornerRadius = CGFloat(profileImageSize / 2)
        
        // user name
        addSubview(userName)
        userName.addTarget(self, action: #selector(userInfoTapped), for: .touchUpInside)
        userName.anchor(
            left:  profileImageView.rightAnchor,
            centerY: profileImageView.centerYAnchor,
            paddingLeft: paddingElement
        )
        // option button
        addSubview(optionsButton)
        optionsButton.addTarget(self, action: #selector(optionsTapped), for: .touchUpInside)
        optionsButton.anchor(
            right: rightAnchor,
            centerY: profileImageView.centerYAnchor,
            paddingRight: paddingEdge
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Func to handle click
    @objc func userInfoTapped() {
        print("userInfoTapped")
    }
    @objc func optionsTapped() {
        print("optionsTapped")
    }
    
    // Helper
    static func newImageView() -> UIImageView {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        return iv
    }
    
    static func getLabelButton(text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        return button
    }
}
