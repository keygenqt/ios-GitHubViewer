//
//  ContentView.swift
//  GitHubViewer
//
//  Created by Виталий Зарубин on 05.10.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image(uiImage: Resources.Assets.phone.image).padding()
            Text(L10n.Other.signIn)
                .padding()
                .foregroundColor(Color(Colors.Text.title.color))
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
