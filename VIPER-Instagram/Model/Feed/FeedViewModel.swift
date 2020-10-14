//
//  FeedViewModel.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/11/20.
//

import Foundation
import UIKit

class FeedViewModel {
    let feedId: CLong
    var userName: String?
    var avatarUrl: String?
    var imagesUrlFeed: [String]?
    var isBookmark: Bool?
    var isLike: Bool?
    var likesNumber: CLong?
    var caption: String?
    var timePost: CLong = 0
    init(feedId: CLong) {
        self.feedId = feedId
    }
}
