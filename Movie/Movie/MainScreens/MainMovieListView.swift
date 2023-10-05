//
//  MovieListView.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-22.
//

import SwiftUI

struct MainMovieListView: View {
   
    @StateObject private var vmUpComing = MovieListViewModel(movieService: MovieService())
    @StateObject private var vmNowPlaying = MovieListViewModel(movieService: MovieService())
    @StateObject private var vmTopRated = MovieListViewModel(movieService: MovieService())
    @StateObject private var vmPopular = MovieListViewModel(movieService: MovieService())
   
    var body: some View {
        
        VStack {
            if self.vmUpComing.loadingState == .success {
                ScrollView (showsIndicators: false) {
                    HeaderImageView(movies: vmUpComing.movieList)
                    MovieListScreen(title: "Now Playing", movies: vmNowPlaying.movieList)
                    MovieListScreen(title: "Top Rated", movies: vmTopRated.movieList)
                    MovieListScreen(title: "Populare", movies: vmPopular.movieList)
                }
                   
            }
            
            else if self.vmUpComing.loadingState == .failed {
                FailedView()
            }
            else if self.vmUpComing.loadingState == .loading {
                LoadingView()
            }
        }
            .navigationTitle("Movie")
            .navigationBarTitleDisplayMode(.inline)
            .embedNavigationView()
            .ignoresSafeArea(.all)
            .preferredColorScheme(.dark)
            .background(Color.AppBackgroundColor)
            .task {
                await vmNowPlaying.getData(with: .nowPlaying)
                await vmTopRated.getData(with: .topRated)
                await vmUpComing.getData(with:.upcoming )
                await vmPopular.getData(with: .popular)
            }
        }
    }


struct MainMovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MainMovieListView()
    }
}


