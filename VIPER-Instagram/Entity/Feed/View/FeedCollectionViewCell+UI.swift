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
            left: LayoutAnchor(equalTo: leftAnchor, constant: ComponentUtil.paddingEdge),
            top: LayoutAnchor(equalTo: topAnchor, constant: ComponentUtil.paddingEdge),
            right: LayoutAnchor(equalTo: rightAnchor, constant: ComponentUtil.paddingEdge)
        )
        configurateHeaderContainer(container: headerContainer)
        
        // ImageContent
        contentContainer = UIView()
        addSubview(contentContainer)
        contentContainer.anchor(
            left: LayoutAnchor(equalTo: leftAnchor),
            top: LayoutAnchor(equalTo: headerContainer.bottomAnchor, constant: ComponentUtil.paddingElement),
            right: LayoutAnchor(equalTo: rightAnchor)
        )
        configurateContentContainer(container: contentContainer)
        // Footer
        footerContainer = UIView()
        addSubview(footerContainer)
        footerContainer.anchor(
            left: LayoutAnchor(equalTo: leftAnchor, constant: ComponentUtil.paddingEdge),
            top: LayoutAnchor(equalTo: contentContainer.bottomAnchor, constant: ComponentUtil.paddingElement),
            right: LayoutAnchor(equalTo: rightAnchor, constant: ComponentUtil.paddingEdge),
            bottom: LayoutAnchor(equalTo: bottomAnchor, constant: ComponentUtil.paddingEdge)
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
            width: LayoutAnchor(equalToConstant: ComponentUtil.interfaceButtonSize, priority: 999),
            height: LayoutAnchor(equalToConstant: ComponentUtil.interfaceButtonSize, priority: 999)
        )
        avatarFeedOwner.layer.cornerRadius = CGFloat(ComponentUtil.interfaceButtonSize / 2)
        
        // user name
        container.addSubview(userNameFeedOwner)
        // layout
        userNameFeedOwner.anchor(
            left: LayoutAnchor(equalTo: avatarFeedOwner.rightAnchor, constant: ComponentUtil.paddingElement),
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
            left: LayoutAnchor(equalTo: container.leftAnchor, constant: ComponentUtil.paddingEdge),
            top: LayoutAnchor(equalTo: imagesFeedContent.bottomAnchor),
            height: LayoutAnchor(equalToConstant: ComponentUtil.interfaceButtonSize, priority: 999)
        )
        
        container.addSubview(bookmarkFeedButton)
        bookmarkFeedButton.anchor(
            top: LayoutAnchor(equalTo: imagesFeedContent.bottomAnchor),
            right: LayoutAnchor(equalTo: container.rightAnchor, constant: ComponentUtil.paddingEdge),
            bottom: LayoutAnchor(equalTo: container.bottomAnchor),
            height: LayoutAnchor(equalToConstant: ComponentUtil.interfaceButtonSize, priority: 999)
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
            top: LayoutAnchor(equalTo: numLikesFeedInfo.bottomAnchor, constant: ComponentUtil.paddingElement),
            right: LayoutAnchor(equalTo: container.rightAnchor)
        )
        // Time
        container.addSubview(feedTime)
        feedTime.anchor(
            left: LayoutAnchor(equalTo: container.leftAnchor),
            top: LayoutAnchor(equalTo: captionFeed.bottomAnchor, constant: ComponentUtil.paddingElement),
            right: LayoutAnchor(equalTo: container.rightAnchor),
            bottom: LayoutAnchor(equalTo: container.bottomAnchor, priority: 999)
        )
    }
    
}
