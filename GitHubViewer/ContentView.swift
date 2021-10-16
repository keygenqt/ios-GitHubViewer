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
        attributedString.foregroundColor = .textTitle
        attributedString.font = .navigationBarTitle
        return attributedString
    }

    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: Resources.Assets.phone.image).padding()
            Text(L10n.Other.signIn)
                .padding()
                .foregroundColor(.blue)
            Text(contentCustomFont)
                .padding()

            Text("System: \(UserModel.mock.name)")
                .padding()
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(.textTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
