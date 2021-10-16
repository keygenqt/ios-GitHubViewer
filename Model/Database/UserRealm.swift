//
//  UserRealm.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 10.10.2021.
//

import Foundation
import RealmSwift

class UserRealm: Object {
    @objc dynamic var identifier: String = ""
    @objc dynamic var login: String = ""
    @objc dynamic var avatarUrl: String = ""
    @objc dynamic var followersUrl: String = ""
    @objc dynamic var reposUrl: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var bio: String = ""
    @objc dynamic var createdAt: String = ""
}

extension UserRealm {
    func toModel() -> UserModel {
        return UserModel(
            login: login,
            avatarUrl: avatarUrl,
            followersUrl: followersUrl,
            reposUrl: reposUrl,
            name: name,
            bio: bio,
            createdAt: createdAt
        )
    }
}
