//
//  MovieDetail.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-30.
//

import SwiftUI

struct MainMovieDetailsViewScreen: View {
    let movieID: Int
    @StateObject private var vm = MovieDetailViewModel(movieService: MovieService())
    var body: some View {
        VStack {
            if self.vm.loadingState == .success {
                if let movie = vm.movieDetail {
                    MovieDetailsView(movieDetailsView: movie)
                    
                }
            }
            else if self.vm.loadingState == .failed {
                FailedView()
            }
            else if self.vm.loadingState == .loading {
                LoadingView()
            }
        }.navigationTitle("Movie")
            .navigationBarTitleDisplayMode(.inline)
        .embedNavigationView()
        .task {
            await vm.loadMovie(id: movieID)
        }
    }
}

struct MainMovieDetailsViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainMovieDetailsViewScreen(movieID: Movie.detailsMovie.id)
    }
}
