//
//  ListRepos.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 16.10.2021.
//

import SwiftUI

struct ListRepos: View {
    let models = [
        RepoModel.mock,
        RepoModel.mock,
        RepoModel.mock,
        RepoModel.mock,
        RepoModel.mock,
        RepoModel.mock,
        RepoModel.mock,
        RepoModel.mock,
        RepoModel.mock,
        RepoModel.mock,
        RepoModel.mock,
        RepoModel.mock,
        RepoModel.mock,
        RepoModel.mock,
        RepoModel.mock,
    ]
    var body: some View {
        NavigationView {
            List(models) { model in
                NavigationLink(destination: ViewRepo(model: model)) {
                    ListReposItem(model: model)
                }
            }.navigationTitle("Repos")
        }
    }
}

struct ListRepos_Previews: PreviewProvider {
    static var previews: some View {
        ListRepos()
    }
}
