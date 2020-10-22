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
        anchor(
            left: LayoutAnchor(equalTo: leftAnchor),
            top: LayoutAnchor(equalTo: topAnchor),
            right: LayoutAnchor(equalTo: rightAnchor),
            bottom: LayoutAnchor(equalTo: bottomAnchor),
            width: LayoutAnchor(equalToConstant: UIScreen.main.bounds.width, priority: 999)
        )
        
        configurateUI()
    }
    
    func bindFeedViewModel(feedViewModel: FeedViewModel) {
        self.feedViewModel = feedViewModel
        // binding data
        if let avt = feedViewModel.avatarUrl {
            avatarFeedOwner.loadImage(withUrl: avt)
        }
        userNameFeedOwner.setTitle(feedViewModel.userName, for: .normal)
        if let imgContent = feedViewModel.imagesUrlFeed {
            imagesFeedContent.loadImage(withUrl: imgContent)
        }
        
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
    
}
