//
//  ViewModel.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 17.10.2021.
//

import Combine
import Foundation

class ReposViewModel: ObservableObject, Identifiable {
    @Published var isShowProgressView = true
    @Published var isLoading = false
    @Published var models: [RepoModel] = [] {
        didSet {
            serviceData.clear()
            if !models.isEmpty {
                serviceData.saveList(models.toRepoRealms())
            }
            if !models.isEmpty {
                isShowProgressView = false
            }
        }
    }

    private var disposables: Set<AnyCancellable> = []

    var serviceNetwork = ReposNetwork()
    var serviceData = ReposData()

    private var isLoadingNetwork: AnyPublisher<Bool, Never> {
        serviceNetwork.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    private var listPublisher: AnyPublisher<[RepoModel], Never> {
        serviceNetwork.$list
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }

    init() {
        isLoadingNetwork
            .receive(on: RunLoop.main)
            .assign(to: \.isLoading, on: self)
            .store(in: &disposables)

        listPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.models, on: self)
            .store(in: &disposables)

        let list = serviceData.getList()

        if list.isEmpty {
            refresh()
        } else {
            serviceNetwork.list = list.toRepoModels()
        }
    }

    func refresh() {
        serviceNetwork.getListRepo()
    }
}
