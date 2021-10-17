//
//  FollowerService.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 17.10.2021.
//

import Alamofire
import Foundation

class FollowerNetwork: APIHandler {
    @Published var list: [FollowerModel] = []
    @Published var isLoading = true

    func getListFollowers() {
        isLoading = true
        AF.request("\(ConstantsApp.API_URL)users/\(ConstantsApp.GITHUB_USER)/followers", method: .get)
            .responseDecodable { [weak self] (response: DataResponse<[FollowerModel], AFError>) in
                sleep(5) // slow internet
                guard let weakSelf = self else { return }
                guard let response = weakSelf.handleResponse(response) as? [FollowerModel] else {
                    weakSelf.isLoading = false
                    return
                }
                weakSelf.isLoading = false
                weakSelf.list = response
            }
    }
}
