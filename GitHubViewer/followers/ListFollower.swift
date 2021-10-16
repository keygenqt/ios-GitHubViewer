//
//  ListFavorite.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 16.10.2021.
//

import SwiftUI

struct ListFollower: View {
    let models = [
        FollowerModel.mock,
        FollowerModel.mock,
        FollowerModel.mock,
        FollowerModel.mock,
        FollowerModel.mock,
        FollowerModel.mock,
    ]
    var body: some View {
        NavigationView {
            List(models) { model in
                ListFollowerItem(model: model)
            }.navigationTitle("Follower")
        }
    }
}

struct ListFavorite_Previews: PreviewProvider {
    static var previews: some View {
        ListFollower()
    }
}
