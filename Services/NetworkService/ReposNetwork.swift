//
//  ReposService.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 17.10.2021.
//

import Alamofire
import Foundation

class ReposNetwork: APIHandler {
    @Published var list: [RepoModel] = []
    @Published var isLoading = false

    func getListRepo() {
        isLoading = true
        AF.request("\(ConstantsApp.API_URL)users/\(ConstantsApp.GITHUB_USER)/repos", method: .get)
            .responseDecodable { [weak self] (response: DataResponse<[RepoModel], AFError>) in
                sleep(5) // slow internet
                guard let weakSelf = self else { return }
                guard let response = weakSelf.handleResponse(response) as? [RepoModel] else {
                    weakSelf.isLoading = false
                    return
                }
                weakSelf.isLoading = false
                weakSelf.list = response
            }
    }
}
