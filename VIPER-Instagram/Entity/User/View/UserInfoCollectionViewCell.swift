//
//  UserProfileInfo.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/25/20.
//

import Foundation
import UIKit

class UserInfoCollectionViewCell: UICollectionViewCell  {
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    // Variables
    static let avatarSize = CGFloat(80)
    //
    lazy var imgAvatar: UIImageView = {
        let image = ComponentUtil.newAspectFillImageView()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(avatarUserTapped))
        image.addGestureRecognizer(tapGestureRecognizer)
        image.anchor(
            width: LayoutAnchor(equalToConstant: UserInfoCollectionViewCell.avatarSize),
            height: LayoutAnchor(equalToConstant: UserInfoCollectionViewCell.avatarSize)
        )
        image.layer.cornerRadius = CGFloat(UserInfoCollectionViewCell.avatarSize / 2)
        return image
    }()
    
    private func configurateUI() {
        let generalInfoContainer = UIView()
        addSubview(generalInfoContainer)
        generalInfoContainer.anchor(
            left: LayoutAnchor(equalTo: leftAnchor),
            top: LayoutAnchor(equalTo: topAnchor),
            right: LayoutAnchor(equalTo: rightAnchor),
            bottom: LayoutAnchor(equalTo: bottomAnchor)
        )
        configuateGeneralInfoContainer(container: generalInfoContainer)
    }
    
    private func configuateGeneralInfoContainer(container: UIView) {
        container.addSubview(imgAvatar)
        imgAvatar.anchor(
            left: LayoutAnchor(equalTo: container.leftAnchor),
            top: LayoutAnchor(equalTo: container.topAnchor)
        )
    }
    private func configuateUserBioInfoContainer(container: UIView) {}
    private func configuateButtonsContainer(container: UIView) {}
    
    
    // Action
    @objc func avatarUserTapped() {}
}
