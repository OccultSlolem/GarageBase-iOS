//
//  ContentView.swift
//  GarageBase
//
//  Created by Ethan Hanlon on 6/21/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ArticleListView()
                .tabItem {
                    Image(systemName: "newspaper.fill")
                    Text("Articles")
                }
            
            ReferenceListView()
                .tabItem {
                    Image(systemName: "text.book.closed.fill")
                    Text("Reference")
                }
            
            CSListView()
                .tabItem {
                    Image(systemName: "chevron.left.slash.chevron.right")
                    Text("Code Snippets")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
