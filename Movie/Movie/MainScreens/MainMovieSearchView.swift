//
//  SearchView.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-29.
//

import SwiftUI

struct MainMovieSearchView: View {
    @StateObject private var movieListVM  = MovieListViewModel(movieService: MovieService())
    
    var body: some View {
      
    VStack {
        SearchMovieTab()
    
        if self.movieListVM.loadingState == .success {
            SearchMovieList(movies: movieListVM.movieSearchList)
            
        }
        else if self.movieListVM.loadingState == .failed {
            FailedView()
         }
        else if self.movieListVM.loadingState == .loading {
            LoadingView()
         }
        
            
        }.navigationTitle("Movie")
            .navigationBarTitleDisplayMode(.inline)
            .embedNavigationView()
            .ignoresSafeArea(.all)
            .preferredColorScheme(.dark)
            .background(Color.AppBackgroundColor)
       
    }
}

struct MainMovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MainMovieSearchView()
    }
}

struct SearchMovieTab: View {
    
    @StateObject private var movieListVM  = MovieListViewModel(movieService: MovieService())
    @State private var searchText = ""
    var body: some View {
        SearchMovieList(movies: movieListVM.movieSearchList)
        .listStyle(.plain)
            .searchable(text:$searchText )
            .onChange(of: searchText) { value in
                Task {
                    if !value.isEmpty {
                        await movieListVM.getSearchData(query: value)
                        
                    } else {
                        movieListVM.movieSearchList.removeAll()
                    }
                }
            }
          
    }
}
