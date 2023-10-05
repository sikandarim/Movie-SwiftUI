//
//  MovieDetailState.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-26.
//

import Foundation

@MainActor
class MovieDetailViewModel: ViewModelBase {

    @Published var movieDetail:MovieDetailsModel? = nil
    
    let movieService : MovieServiceType
    
    init(movieService:MovieServiceType ) {
        self.movieService = movieService
    }
   
    func loadMovie(id: Int) async  {
        self.loadingState = .loading
        do {
            let movieDetails = try await movieService.fetchMovie(id: id)
            self.movieDetail = MovieDetailsModel(movie: movieDetails)
            self.loadingState = .success
        } catch {
            self.loadingState = .failed
            print(error)
        }
    }
    
    
}






