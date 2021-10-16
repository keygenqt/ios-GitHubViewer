//
//  FollowerModel.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 09.10.2021.
//

import Foundation

struct FollowerModel: Codable, Equatable, Identifiable {
    let id: String?
    let login: String?
    let avatarUrl: String
    let followersUrl: String?
    let reposUrl: String?
    let name: String
    let bio: String?
    let createdAt: String?
}

extension FollowerModel {
    func toRealm() -> FollowerRealm {
        let realmModel = FollowerRealm()

        realmModel.id = id ?? UUID().uuidString
        realmModel.login = login ?? ""
        realmModel.avatarUrl = avatarUrl
        realmModel.followersUrl = followersUrl ?? ""
        realmModel.reposUrl = reposUrl ?? ""
        realmModel.name = name
        realmModel.bio = bio ?? ""
        realmModel.createdAt = createdAt ?? ""

        return realmModel
    }

    static var mock: FollowerModel {
        return FollowerModel(
            id: UUID().uuidString,
            login: "keygenqt",
            avatarUrl: [
                "https://www.zastavki.com/pictures/1920x1080/2015/Girls_Red-haired_girl_under_the_branches_of_spruce_105473_23.jpg",
                "https://w.wallhaven.cc/full/ym/wallhaven-ym192l.jpg",
                "https://img1.goodfon.ru/original/1920x1200/9/99/devushka-osen-park-bryunetka.jpg",
                "https://w-dog.ru/wallpapers/0/96/371424389841459/lico-devushka-shatenka.jpg",
                "https://www.wallpaperup.com/uploads/wallpapers/2019/02/19/1313727/427e22c10e737867337fcdb0670e6112-1400.jpg",
            ].randomElement()!,
            followersUrl: "",
            reposUrl: "",
            name: [
                "Zoey",
                "Chloe",
                "Amani",
                "Amaia",
            ].randomElement()!,
            bio: nil,
            createdAt: nil
        )
    }
}
