//
//  FeedCellDelegate.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/22/20.
//

import Foundation

protocol FeedCellDelegate {
    func userInfoFeedOwnerTapped(feedIndentifier: IndexPath)
    func optionsButtonTapped(feedIndentifier: IndexPath)
    func likeFeedButtonTapped(feedIndentifier: IndexPath)
    func commentFeedButtonTapped(feedIndentifier: IndexPath)
    func sentFeedButtonTapped(feedIndentifier: IndexPath)
    func bookmarkFeedButtonTapped(feedIndentifier: IndexPath)
    func numLikesFeedInfoTapped(feedIndentifier: IndexPath)
}
