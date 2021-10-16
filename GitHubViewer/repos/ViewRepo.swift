//
//  ContentView.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 05.10.2021.
//

import Kingfisher
import SwiftUI

struct ViewRepo: View {
    var model: RepoModel

    var contentCustomFont: AttributedString {
        var attributedString = AttributedString("Name: \(model.name)")
        attributedString.foregroundColor = .textTitle
        attributedString.font = .navigationBarTitle
        return attributedString
    }

    var body: some View {
        ScrollView {
            VStack {
                KFImage(URL(string: model.avatarUrl)!)
                    .placeholder {
                        Image(uiImage: Resources.Assets.user.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    .resizable()
                    .aspectRatio(contentMode: .fit)

                VStack(alignment: .leading) {
                    Text(contentCustomFont)

                    Divider().frame(height: 10)

                    HStack {
                        Text(model.login!)
                        Spacer()
                        Text("Login")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                    Divider()

                    HStack {
                        Text(model.createdAt!)
                        Spacer()
                        Text("Created At")
                    }
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                    Divider()

                    if model.bio != nil {
                        Text(L10n.Other.titleBio).font(.title2)
                        Text(model.bio!).padding(.top, 0.5)
                    }
                }
                .padding()

                Spacer()
            }
            .padding(.top)
            .padding(.bottom)
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ViewRepo(model: RepoModel.mock)
    }
}
