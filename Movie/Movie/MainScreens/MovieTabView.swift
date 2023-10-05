//
//  MainView.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-29.
//

import SwiftUI

struct MovieTabView: View {
    var body: some View {
        TabView {
            MainMovieListView()
                .tabItem{
                    Image(systemName: "tv")
                    Text("Movies")

                }
            MainMovieSearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
 
        }
    }
}

struct MovieTabView_Previews: PreviewProvider {
    static var previews: some View {
        MovieTabView()
    }
}
