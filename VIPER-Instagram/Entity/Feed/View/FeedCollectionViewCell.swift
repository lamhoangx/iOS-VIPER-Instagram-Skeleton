//
//  FeedCollectionCellView.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/12/20.
//

import Foundation
import UIKit

class FeedCollectionViewCell: UICollectionViewCell {
    //static field
    public static let interfaceButtonSize: CGFloat = 40
    public static let paddingEdge: CGFloat = 12
    public static let paddingElement: CGFloat = 8
    public static let feedImageContentHeight: CGFloat = 300
    public static let captionTest = ""
    //
    
    // Constraint size
    private var feedViewModel: FeedViewModel?
    
    // Header container
    // Avatar user
    lazy var avatarFeedOwner: UIImageView = {
        let image = FeedCollectionViewCell.newImageView()
        // registry action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(userInfoFeedOwnerTapped))
        image.addGestureRecognizer(tapGestureRecognizer)
        return image
    }()
    // Username
    lazy var userNameFeedOwner: UIButton = {
        let userName = FeedCollectionViewCell.newLabelButton(text: "UserName")
        // registry action
        userName.addTarget(self, action: #selector(userInfoFeedOwnerTapped), for: .touchUpInside)
        return userName
    }()
    // Option button
    lazy var optionsButton: UIButton = {
        let labelButton = FeedCollectionViewCell.newLabelButton(text: "•••")
        labelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        // registry action
        labelButton.addTarget(self, action: #selector(optionsButtonTapped), for: .touchUpInside)
        return labelButton
    }()
    //
    // Content containter
    lazy var imagesFeedContent: UIImageView = {
        let image = FeedCollectionViewCell.newImageView()
        // registry action
        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imagesFeedContentDoubleTapped))
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        image.addGestureRecognizer(doubleTapGestureRecognizer)
        return image
    }()
    // Like button
    lazy var likeFeedButton: UIButton = {
        let button = FeedCollectionViewCell.newButton()
        button.setImage(#imageLiteral(resourceName: "Activity"), for: .normal)
        button.addTarget(self, action: #selector(likeFeedButtonTapped), for: .touchUpInside)
        return button
    }()
    // Comment button
    lazy var commentFeedButton: UIButton = {
        let button = FeedCollectionViewCell.newButton()
        button.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        button.addTarget(self, action: #selector(commentFeedButtonTapped), for: .touchUpInside)
        return button
    }()
    // Sent button
    lazy var sentFeedButton: UIButton = {
        let button = FeedCollectionViewCell.newButton()
        button.setImage( #imageLiteral(resourceName: "send"), for: .normal)
        button.addTarget(self, action: #selector(sentFeedButtonTapped), for: .touchUpInside)
        return button
    }()
    // Bookmark
    lazy var bookmarkFeedButton: UIButton = {
        let button = FeedCollectionViewCell.newButton()
        button.setImage( #imageLiteral(resourceName: "bookmark"), for: .normal)
        button.addTarget(self, action: #selector(bookmarkFeedButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // Footer container
    // Like number
    lazy var numLikesFeedInfo: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.text = "999 likes"
        let likeTap = UITapGestureRecognizer(target: self, action: #selector(numLikesFeedInfoTapped))
        likeTap.numberOfTapsRequired = 1
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(likeTap)
        
        return label
    }()
    // Caption
    let captionFeed: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.text = FeedCollectionViewCell.captionTest
        return label
    }()
    // Time post
    let feedTime: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.text = "999 years ago"
        return label
    }()
    
    // build UI
    var headerContainer: UIView!
    var contentContainer: UIView!
    var footerContainer: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.anchor(
            left: LayoutAnchor(equalTo: leftAnchor),
            top: LayoutAnchor(equalTo: topAnchor),
            right: LayoutAnchor(equalTo: rightAnchor),
            bottom: LayoutAnchor(equalTo: bottomAnchor),
            width: LayoutAnchor(equalToConstant: UIScreen.main.bounds.width)
        )
        configurateUI()
    }
    
    func bindFeedViewModel(feedViewModel: FeedViewModel) {
        self.feedViewModel = feedViewModel
        // binding data
        userNameFeedOwner.setTitle(feedViewModel.userName, for: .normal)
        numLikesFeedInfo.text = "\(feedViewModel.likesNumber! as UInt64) likes"
        captionFeed.text = feedViewModel.caption
        feedTime.text = "\(feedViewModel.timePost! as UInt64) years ago"
        if feedViewModel.isLike! {
            likeFeedButton.setImage(#imageLiteral(resourceName: "ActivitySelected"), for: .normal)
        } else {
            likeFeedButton.setImage(#imageLiteral(resourceName: "Activity"), for: .normal)
        }
        if feedViewModel.isBookmark! {
            bookmarkFeedButton.setImage(#imageLiteral(resourceName: "bookmark_selected"), for: .normal)
        } else {
            bookmarkFeedButton.setImage(#imageLiteral(resourceName: "bookmark"), for: .normal)
        }
    }
    
    private func configurateUI() {
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
            centerY: LayoutAnchor(equalTo: avatarFeedOwner.centerYAnchor)
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
            height: LayoutAnchor(equalToConstant: FeedCollectionViewCell.feedImageContentHeight)
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
            top: LayoutAnchor(equalTo: container.topAnchor)
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Func to handle click
    @objc func userInfoFeedOwnerTapped() {
        print("userInfoTapped")
    }
    @objc func optionsButtonTapped() {
        print("optionsTapped")
    }
    @objc func imagesFeedContentDoubleTapped() {
        print("feedImageContentDoubleTapped")
    }
    @objc func likeFeedButtonTapped() {
        print("likeButtonTapped")
    }
    @objc func commentFeedButtonTapped() {
        print("commentButtonTapped")
    }
    @objc func sentFeedButtonTapped() {
        print("sentButtonTapped")
    }
    @objc func bookmarkFeedButtonTapped() {
        print("bookMarkButtonTapped")
    }
    @objc func numLikesFeedInfoTapped() {
        print("likesInfoTapped")
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
