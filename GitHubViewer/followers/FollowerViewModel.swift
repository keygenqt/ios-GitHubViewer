//
//  FollowerViewModel.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 17.10.2021.
//

import Combine
import Foundation

class FollowerViewModel: ObservableObject, Identifiable {
    @Published var isShowProgressView = true
    @Published var isLoading = false
    @Published var models: [FollowerModel] = [] {
        didSet {
            serviceData.clear()
            if !models.isEmpty {
                serviceData.saveList(models.toFollowerRealms())
            }
            if !models.isEmpty {
                isShowProgressView = false
            }
        }
    }

    private var disposables: Set<AnyCancellable> = []

    var serviceNetwork = FollowerNetwork()
    var serviceData = FollowerData()

    private var isLoadingNetwork: AnyPublisher<Bool, Never> {
        serviceNetwork.$isLoading
            .receive(on: RunLoop.main)
            .map { $0 }
            .eraseToAnyPublisher()
    }

    private var listPublisher: AnyPublisher<[FollowerModel], Never> {
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
            serviceNetwork.list = list.toFollowerModels()
        }
    }

    func refresh() {
        serviceNetwork.getListFollowers()
    }
}
