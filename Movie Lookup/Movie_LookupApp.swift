//
//  Movie_LookupApp.swift
//  Movie Lookup
//
//  Created by Gary Bull on 17/11/2023.
//

import SwiftUI

@main
struct Movie_LookupApp: App {
    var body: some Scene {
        WindowGroup {
            TabView{
                DiscoverView()
                    .tabItem { Image(systemName: "popcorn") }
                Text("Favourites")
                    .tabItem { Image(systemName: "heart.fill") }
                Text("Bookmarked")
                    .tabItem { Image(systemName: "bookmark.fill") }
            }
            
        }
    }
}

