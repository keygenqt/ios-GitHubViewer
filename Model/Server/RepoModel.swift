//
//  RepoModel.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 09.10.2021.
//

import Foundation

struct RepoModel: Codable, Equatable, Identifiable {
    let id: String?
    let login: String?
    let avatarUrl: String
    let followersUrl: String?
    let reposUrl: String?
    let name: String
    let bio: String?
    let createdAt: String?
}

extension RepoModel {
    func toRealm() -> RepoRealm {
        let realmModel = RepoRealm()

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

    static var mock: RepoModel {
        return RepoModel(
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
            bio: "Web applications are increasingly showing recommended users from social media along with some descriptions, an attempt to show relevancy - why they are being shown. For example, Twitter search for a topical keyword shows expert twitterers on the side for 'whom to follow'.",
            createdAt: "Saturday, October 16, 2021"
        )
    }
}
