//
//  FeedCollectionViewCell+UI.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/16/20.
//

import Foundation
import UIKit

extension FeedCollectionViewCell {
    
    open func configurateUI() {
        // Header
        headerContainer = UIView()
        addSubview(headerContainer)
        headerContainer.anchor(
            left: LayoutAnchor(equalTo: leftAnchor, constant: FeedCollectionViewCell.paddingEdge),
            top: LayoutAnchor(equalTo: topAnchor, constant: FeedCollectionViewCell.paddingEdge),
            right: LayoutAnchor(equalTo: rightAnchor, constant: FeedCollectionViewCell.paddingEdge),
            width: LayoutAnchor(equalToConstant: UIScreen.main.bounds.width)
        )
        configurateHeaderContainer(container: headerContainer)
        
        // ImageContent
        contentContainer = UIView()
        addSubview(contentContainer)
        contentContainer.anchor(
            left: LayoutAnchor(equalTo: leftAnchor),
            top: LayoutAnchor(equalTo: headerContainer.bottomAnchor, constant: FeedCollectionViewCell.paddingElement),
            right: LayoutAnchor(equalTo: rightAnchor),
            width: LayoutAnchor(equalToConstant: UIScreen.main.bounds.width)
        )
        configurateContentContainer(container: contentContainer)
        // Footer
        footerContainer = UIView()
        addSubview(footerContainer)
        footerContainer.anchor(
            left: LayoutAnchor(equalTo: leftAnchor, constant: FeedCollectionViewCell.paddingEdge),
            top: LayoutAnchor(equalTo: contentContainer.bottomAnchor, constant: FeedCollectionViewCell.paddingElement),
            right: LayoutAnchor(equalTo: rightAnchor, constant: FeedCollectionViewCell.paddingEdge),
            bottom: LayoutAnchor(equalTo: bottomAnchor, constant: FeedCollectionViewCell.paddingEdge),
            width: LayoutAnchor(equalToConstant: UIScreen.main.bounds.width)
        )
        configurateFooterContainer(container: footerContainer)
    }
    
    private func configurateHeaderContainer(container: UIView) {

        //Image profile
        container.addSubview(avatarFeedOwner)
        // layout
        avatarFeedOwner.anchor(
            left: LayoutAnchor(equalTo: container.leftAnchor),
            top: LayoutAnchor(equalTo: container.topAnchor),
            width: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize),
            height: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize)
        )
        avatarFeedOwner.layer.cornerRadius = CGFloat(FeedCollectionViewCell.interfaceButtonSize / 2)
        
        // user name
        container.addSubview(userNameFeedOwner)
        // layout
        userNameFeedOwner.anchor(
            left: LayoutAnchor(equalTo: avatarFeedOwner.rightAnchor, constant: FeedCollectionViewCell.paddingElement),
            centerY: LayoutAnchor(equalTo: avatarFeedOwner.centerYAnchor),
            width: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize),
            height: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize)
        )
        // option button
        container.addSubview(optionsButton)
        // layout
        optionsButton.anchor(
            right: LayoutAnchor(equalTo: container.rightAnchor),
            bottom: LayoutAnchor(equalTo: container.bottomAnchor),
            centerY: LayoutAnchor(equalTo: avatarFeedOwner.centerYAnchor)
        )
    }
    private func configurateContentContainer(container: UIView) {
        // Image content
        container.addSubview(imagesFeedContent)
        imagesFeedContent.anchor(
            left: LayoutAnchor(equalTo: container.leftAnchor),
            top: LayoutAnchor(equalTo: container.topAnchor),
            right: LayoutAnchor(equalTo: container.rightAnchor),
            height: LayoutAnchor(equalToConstant: UIScreen.main.bounds.width)
        )
        // Interact button
        let stackHorizontalView = UIStackView(arrangedSubviews: [likeFeedButton, commentFeedButton, sentFeedButton])
        stackHorizontalView.axis = .horizontal
        stackHorizontalView.distribution = .equalCentering
        
        container.addSubview(stackHorizontalView)
        stackHorizontalView.anchor(
            left: LayoutAnchor(equalTo: container.leftAnchor, constant: FeedCollectionViewCell.paddingEdge),
            top: LayoutAnchor(equalTo: imagesFeedContent.bottomAnchor)
        )
        
        container.addSubview(bookmarkFeedButton)
        bookmarkFeedButton.anchor(
            top: LayoutAnchor(equalTo: imagesFeedContent.bottomAnchor),
            right: LayoutAnchor(equalTo: container.rightAnchor, constant: FeedCollectionViewCell.paddingEdge),
            bottom: LayoutAnchor(equalTo: container.bottomAnchor)
        )
    }
    private func configurateFooterContainer(container: UIView) {
        //Likes info
        container.addSubview(numLikesFeedInfo)
        numLikesFeedInfo.anchor(
            left: LayoutAnchor(equalTo: container.leftAnchor),
            top: LayoutAnchor(equalTo: container.topAnchor),
            right: LayoutAnchor(equalTo: container.rightAnchor)
        )
        // Caption
        container.addSubview(captionFeed)
        captionFeed.anchor(
            left: LayoutAnchor(equalTo: container.leftAnchor),
            top: LayoutAnchor(equalTo: numLikesFeedInfo.bottomAnchor, constant: FeedCollectionViewCell.paddingElement),
            right: LayoutAnchor(equalTo: container.rightAnchor)
        )
        // Time
        container.addSubview(feedTime)
        feedTime.anchor(
            left: LayoutAnchor(equalTo: container.leftAnchor),
            top: LayoutAnchor(equalTo: captionFeed.bottomAnchor, constant: FeedCollectionViewCell.paddingElement),
            right: LayoutAnchor(equalTo: container.rightAnchor),
            bottom: LayoutAnchor(equalTo: container.bottomAnchor)
        )
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
    
    // Return Button with height = 40 - $interfaceInteractSize
    static func newLabelButton(text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.anchor(
            width: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize),
            height: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize)
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
            width: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize),
            height: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize)
        )
        return button
    }
}
