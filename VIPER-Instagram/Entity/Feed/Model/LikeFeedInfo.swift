//
//  LikeFeedInfo.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/15/20.
//

import Foundation

class LikeFeedInfo {
    var likeNumber: UInt64
    var familiarUser: [UserModel]?
    init(likeNum: UInt64) {
        self.likeNumber = likeNum
    }
}
