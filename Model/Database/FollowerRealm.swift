//
//  FollowerRealm.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 16.10.2021.
//

import Foundation
import RealmSwift

class FollowerRealm: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var login: String = ""
    @objc dynamic var avatarUrl: String = ""
    @objc dynamic var followersUrl: String = ""
    @objc dynamic var reposUrl: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var bio: String = ""
    @objc dynamic var createdAt: String = ""
}

extension FollowerRealm {
    func toModel() -> FollowerModel {
        return FollowerModel(
            id: id,
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
