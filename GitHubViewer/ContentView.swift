//
//  ContentView.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 05.10.2021.
//

import Kingfisher
import SwiftUI

struct ContentView: View {
    var contentCustomFont: AttributedString {
        var attributedString = AttributedString("Custom: \(UserModel.mock.name)")
        attributedString.foregroundColor = Color(Colors.Text.title.color)
        attributedString.font = FontFamily.Montserrat.bold.font(size: 28)
        return attributedString
    }

    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: UserModel.mock.avatarUrl)!)
            Image(uiImage: Resources.Assets.phone.image).padding()
            Text(L10n.Other.signIn)
                .padding()
                .foregroundColor(.blue)
            Text(contentCustomFont)
                .padding()

            Text("System: \(UserModel.mock.name)")
                .padding()
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color(Colors.Text.title.color))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
