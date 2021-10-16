//
//  NavTab.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 16.10.2021.
//

import SwiftUI

struct NavTab: View {
    @State var selectedView = 1

    var body: some View {
        TabView {
            ListRepos()
                .tabItem {
                    Image(systemName: "list.bullet.circle")
                        .font(.largeTitle)
                }
                .tag(1)

            ContentView()
                .tabItem {
                    Image(systemName: "person.circle")
                        .font(.largeTitle)
                }
                .tag(2)
        }
    }
}

struct NavTab_Previews: PreviewProvider {
    static var previews: some View {
        NavTab()
    }
}
