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
            right: LayoutAnchor(equalTo: rightAnchor, constant: FeedCollectionViewCell.paddingEdge)
        )
        configurateHeaderContainer(container: headerContainer)
        
        // ImageContent
        contentContainer = UIView()
        addSubview(contentContainer)
        contentContainer.anchor(
            left: LayoutAnchor(equalTo: leftAnchor),
            top: LayoutAnchor(equalTo: headerContainer.bottomAnchor, constant: FeedCollectionViewCell.paddingElement),
            right: LayoutAnchor(equalTo: rightAnchor)
        )
        configurateContentContainer(container: contentContainer)
        // Footer
        footerContainer = UIView()
        addSubview(footerContainer)
        footerContainer.anchor(
            left: LayoutAnchor(equalTo: leftAnchor, constant: FeedCollectionViewCell.paddingEdge),
            top: LayoutAnchor(equalTo: contentContainer.bottomAnchor, constant: FeedCollectionViewCell.paddingElement),
            right: LayoutAnchor(equalTo: rightAnchor, constant: FeedCollectionViewCell.paddingEdge),
            bottom: LayoutAnchor(equalTo: bottomAnchor, constant: FeedCollectionViewCell.paddingEdge)
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
            width: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize, priority: 999),
            height: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize, priority: 999)
        )
        avatarFeedOwner.layer.cornerRadius = CGFloat(FeedCollectionViewCell.interfaceButtonSize / 2)
        
        // user name
        container.addSubview(userNameFeedOwner)
        // layout
        userNameFeedOwner.anchor(
            left: LayoutAnchor(equalTo: avatarFeedOwner.rightAnchor, constant: FeedCollectionViewCell.paddingElement),
            top: LayoutAnchor(equalTo: container.topAnchor),
            bottom: LayoutAnchor(equalTo: container.bottomAnchor),
            centerY: LayoutAnchor(equalTo: avatarFeedOwner.centerYAnchor)
        )
        // option button
        container.addSubview(optionsButton)
        // layout
        optionsButton.anchor(
            top: LayoutAnchor(equalTo: container.topAnchor),
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
            height: LayoutAnchor(equalToConstant: UIScreen.main.bounds.width, priority: 999)
        )
        
        // Interact button
        let stackHorizontalView = UIStackView(arrangedSubviews: [likeFeedButton, commentFeedButton, sentFeedButton])
        stackHorizontalView.axis = .horizontal
        stackHorizontalView.distribution = .equalCentering
        
        container.addSubview(stackHorizontalView)
        stackHorizontalView.anchor(
            left: LayoutAnchor(equalTo: container.leftAnchor, constant: FeedCollectionViewCell.paddingEdge),
            top: LayoutAnchor(equalTo: imagesFeedContent.bottomAnchor),
            height: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize, priority: 999)
        )
        
        container.addSubview(bookmarkFeedButton)
        bookmarkFeedButton.anchor(
            top: LayoutAnchor(equalTo: imagesFeedContent.bottomAnchor),
            right: LayoutAnchor(equalTo: container.rightAnchor, constant: FeedCollectionViewCell.paddingEdge),
            bottom: LayoutAnchor(equalTo: container.bottomAnchor),
            height: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize, priority: 999)
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
            bottom: LayoutAnchor(equalTo: container.bottomAnchor, priority: 999)
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
            height: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize, priority: 999)
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
            width: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize, priority: 999),
            height: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize, priority: 999))
        return button
    }
}
