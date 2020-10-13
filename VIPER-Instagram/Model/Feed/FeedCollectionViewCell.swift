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
    // Feed Image content
    let feedImageContent: UIImageView = {
        let image = newImageView()
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func bindFeedViewModel(feedViewModel: FeedViewModel) {
        self.feedViewModel = feedViewModel
        // binding data
        
        configurateUI()
    }
    
    // build UI
    private func configurateUI() {
        // Header
        configurateHeader()
        // ImageContent
        configurateFeedImage()
    }
    
    private func configurateHeader() {
        //Image profile
        addSubview(profileImageView)
        // registry action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(userInfoTapped))
        profileImageView.addGestureRecognizer(tapGestureRecognizer)
        // layout
        profileImageView.anchor(
            left: LayoutAnchor(equalTo: leftAnchor, constant: paddingEdge),
            top: LayoutAnchor(equalTo: topAnchor, constant: paddingEdge),
            width: LayoutAnchor(constant: profileImageSize),
            height: LayoutAnchor(constant: profileImageSize)
        )
        profileImageView.layer.cornerRadius = CGFloat(profileImageSize / 2)
        
        // user name
        addSubview(userName)
        // registry action
        userName.addTarget(self, action: #selector(userInfoTapped), for: .touchUpInside)
        // layout
        userName.anchor(
            left: LayoutAnchor(equalTo: profileImageView.rightAnchor, constant: paddingElement),
            centerY: LayoutAnchor(equalTo: profileImageView.centerYAnchor)
        )
        // option button
        addSubview(optionsButton)
        // registry action
        optionsButton.addTarget(self, action: #selector(optionsTapped), for: .touchUpInside)
        // layout
        optionsButton.anchor(
            right: LayoutAnchor(equalTo: rightAnchor, constant: paddingEdge),
            centerY: LayoutAnchor(equalTo: profileImageView.centerYAnchor)
        )
    }
    private func configurateFeedImage() {
        addSubview(feedImageContent)
        // registry action
        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(feedImageContentDoubleTapped))
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        feedImageContent.addGestureRecognizer(doubleTapGestureRecognizer)
        // layout
        feedImageContent.anchor(
            left: LayoutAnchor(equalTo: leftAnchor),
            top: LayoutAnchor(equalTo: profileImageView.bottomAnchor, constant: paddingEdge),
            right: LayoutAnchor(equalTo: rightAnchor),
            height: LayoutAnchor(equalTo: widthAnchor)
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
    @objc func feedImageContentDoubleTapped() {
        print("feedImageContentDoubleTapped")
    }
    
    // Helper
    static func newImageView() -> UIImageView {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.isUserInteractionEnabled = true
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
