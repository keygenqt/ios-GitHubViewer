//
//  UserResponse.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 09.10.2021.
//

import Foundation

struct UserModel: Codable, Equatable {
    let identifier: String?
    let login: String?
    let avatarUrl: String?
    let followersUrl: String?
    let reposUrl: String?
    let name: String
    let bio: String?
    let createdAt: String?
}

extension UserModel {

    func toRealm() -> UserRealm {
        let realmModel = UserRealm()

        realmModel.identifier = self.identifier ?? ""
        realmModel.login = self.login ?? ""
        realmModel.avatarUrl = self.avatarUrl ?? ""
        realmModel.followersUrl = self.followersUrl ?? ""
        realmModel.reposUrl = self.reposUrl ?? ""
        realmModel.name = self.name
        realmModel.bio = self.bio ?? ""
        realmModel.createdAt = self.createdAt ?? ""

        return realmModel
    }

    static var mock: UserModel {
        return UserModel(
            identifier: "identifier",
            login: "keygenqt",
            avatarUrl: "https://keygenqt.com/images/index/web.jpg",
            followersUrl: "",
            reposUrl: "",
            name: "Vitaliy",
            bio: nil,
            createdAt: nil
        )
    }
}
