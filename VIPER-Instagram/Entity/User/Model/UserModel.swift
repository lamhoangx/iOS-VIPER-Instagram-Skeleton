//
//  UserModel.swift
//  VIPER-Instagram
//
//  Created by LamHX on 10/15/20.
//

import Foundation

class UserModel {
    
    let userId: CLong
    var username: String?
    var avatar: String?
    var birthday: CLong?
    
    init(uid: CLong) {
        self.userId = uid
    }
}
