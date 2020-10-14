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
    //
    
    // Constraint size
    private var feedViewModel: FeedViewModel?
    
    // Header
    // Image
    lazy var profileImageView: UIImageView = {
        let image = FeedCollectionViewCell.newImageView()
        // registry action
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(userInfoTapped))
        image.addGestureRecognizer(tapGestureRecognizer)
        return image
    }()
    // Username
    lazy var userName: UIButton = {
        let userName = FeedCollectionViewCell.newLabelButton(text: "UserName")
        // registry action
        userName.addTarget(self, action: #selector(userInfoTapped), for: .touchUpInside)
        return userName
    }()
    // Option
    lazy var optionsButton: UIButton = {
        let labelButton = FeedCollectionViewCell.newLabelButton(text: "•••")
        labelButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        // registry action
        labelButton.addTarget(self, action: #selector(optionsTapped), for: .touchUpInside)
        return labelButton
    }()
    //
    // Feed Image content
    lazy var feedImageContent: UIImageView = {
        let image = FeedCollectionViewCell.newImageView()
        // registry action
        let doubleTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(feedImageContentDoubleTapped))
        doubleTapGestureRecognizer.numberOfTapsRequired = 2
        image.addGestureRecognizer(doubleTapGestureRecognizer)
        return image
    }()
    //
    // Interact function bar
    // Like
    // Like
    lazy var likeButton: UIButton = {
        let button = FeedCollectionViewCell.newButton()
        button.setImage(#imageLiteral(resourceName: "like"), for: .normal)
        button.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
        return button
    }()
    // Comment
    lazy var commentButton: UIButton = {
        let button = FeedCollectionViewCell.newButton()
        button.setImage(#imageLiteral(resourceName: "comment"), for: .normal)
        button.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
        return button
    }()
    // Sent
    lazy var sentButton: UIButton = {
        let button = FeedCollectionViewCell.newButton()
        button.setImage( #imageLiteral(resourceName: "send"), for: .normal)
        button.addTarget(self, action: #selector(sentButtonTapped), for: .touchUpInside)
        return button
    }()
    // Bookmark
    lazy var bookmarkButton: UIButton = {
        let button = FeedCollectionViewCell.newButton()
        button.setImage( #imageLiteral(resourceName: "collect"), for: .normal)
        button.addTarget(self, action: #selector(bookMarkButtonTapped), for: .touchUpInside)
        return button
    }()
    
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
        
    }
    
    // build UI
    private func configurateUI() {
        // Header
        configurateHeader()
        // ImageContent
        configurateFeedImage()
        // Interact function bar
        configurateInteractFunctionBar()
    }
    
    private func configurateHeader() {
        //Image profile
        addSubview(profileImageView)
        // layout
        profileImageView.anchor(
            left: LayoutAnchor(equalTo: leftAnchor, constant: FeedCollectionViewCell.paddingEdge),
            top: LayoutAnchor(equalTo: topAnchor, constant: FeedCollectionViewCell.paddingEdge),
            width: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize),
            height: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize)
        )
        profileImageView.layer.cornerRadius = CGFloat(FeedCollectionViewCell.interfaceButtonSize / 2)
        
        // user name
        addSubview(userName)
        // layout
        userName.anchor(
            left: LayoutAnchor(equalTo: profileImageView.rightAnchor, constant: FeedCollectionViewCell.paddingElement),
            centerY: LayoutAnchor(equalTo: profileImageView.centerYAnchor)
        )
        // option button
        addSubview(optionsButton)
        // layout
        optionsButton.anchor(
            right: LayoutAnchor(equalTo: rightAnchor, constant: FeedCollectionViewCell.paddingEdge),
            centerY: LayoutAnchor(equalTo: profileImageView.centerYAnchor)
        )
    }
    private func configurateFeedImage() {
        addSubview(feedImageContent)
        // layout
        feedImageContent.anchor(
            left: LayoutAnchor(equalTo: leftAnchor),
            top: LayoutAnchor(equalTo: profileImageView.bottomAnchor, constant: FeedCollectionViewCell.paddingElement),
            right: LayoutAnchor(equalTo: rightAnchor),
//            bottom: LayoutAnchor(equalTo: bottomAnchor),
            height: LayoutAnchor(equalToConstant: FeedCollectionViewCell.feedImageContentHeight)
        )
    }

    private func configurateInteractFunctionBar() {
        let stackHorizontalView = UIStackView(arrangedSubviews: [likeButton, commentButton, sentButton])
        stackHorizontalView.axis = .horizontal
        stackHorizontalView.distribution = .equalCentering
        
        addSubview(stackHorizontalView)
        stackHorizontalView.anchor(
            left: LayoutAnchor(equalTo: leftAnchor, constant: FeedCollectionViewCell.paddingEdge),
            top: LayoutAnchor(equalTo: feedImageContent.bottomAnchor)
        )
        
        addSubview(bookmarkButton)
        bookmarkButton.anchor(
            top: LayoutAnchor(equalTo: feedImageContent.bottomAnchor),
            right: LayoutAnchor(equalTo: rightAnchor, constant: FeedCollectionViewCell.paddingEdge),
            bottom: LayoutAnchor(equalTo: bottomAnchor)
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
    @objc func likeButtonTapped() {
        print("likeButtonTapped")
    }
    @objc func commentButtonTapped() {
        print("commentButtonTapped")
    }
    @objc func sentButtonTapped() {
        print("sentButtonTapped")
    }
    @objc func bookMarkButtonTapped() {
        print("bookMarkButtonTapped")
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
        button.imageEdgeInsets = UIEdgeInsets(top: 8,left: 8,bottom: 8,right: 8)
        button.anchor(
            width: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize),
            height: LayoutAnchor(equalToConstant: FeedCollectionViewCell.interfaceButtonSize)
        )
        return button
    }
}
