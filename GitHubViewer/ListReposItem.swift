//
//  ListReposItem.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 16.10.2021.
//

import Kingfisher
import SwiftUI

struct ListReposItem: View {
    var model: UserModel

    var body: some View {
        HStack {
            KFImage(URL(string: model.avatarUrl)!)
                .placeholder {
                    VStack(alignment: .leading) {
                        Image(systemName: "person.fill")
                            .frame(width: 30, height: 30)
                    }
                    .background(Color(white: 0.90))
                    .clipShape(Circle())
                }
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .frame(width: 50, height: 50)

            Text(model.name)

            Spacer()
        }
    }
}

struct ListReposItem_Previews: PreviewProvider {
    static var previews: some View {
        ListReposItem(model: UserModel.mock)
    }
}
