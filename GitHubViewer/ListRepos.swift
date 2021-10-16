//
//  ListRepos.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 16.10.2021.
//

import SwiftUI

struct ListRepos: View {
    let models = [
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
        UserModel.mock,
    ]
    var body: some View {
        List(models) { model in
            ListReposItem(model: model)
        }
    }
}

struct ListRepos_Previews: PreviewProvider {
    static var previews: some View {
        ListRepos()
    }
}
