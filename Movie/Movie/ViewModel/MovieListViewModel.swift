//
//  MovieListViewModel.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-22.
//

import Foundation

@MainActor
class MovieListViewModel: ViewModelBase {
    
    @Published var movieList = [MovieViewModel]()
    @Published var movieSearchList = [MovieViewModel]()
    
    let movieService : MovieServiceType
    
    init(movieService:MovieServiceType ) {
        self.movieService = movieService
    }
    
    //Data to search all movie basesd on end point
    func getData(with endpoint: MovieEndPoint) async {
        self.loadingState = .loading
        do {
            let movieList = try await movieService.fetchMovies(from:endpoint )
            self.movieList = movieList.results.map(MovieViewModel.init)
            self.loadingState = .success
            
        } catch {
            print(error.localizedDescription)
            self.loadingState = .failed
        }
    }
    
    //Data based on search query
    func getSearchData(query: String) async {
        if query.isEmpty {
            return
        }
        self.loadingState = .loading
        do {
            let movieList = try await movieService.searchMovie(query: query.trimmedAndEscaped())
            self.movieSearchList = movieList.results.map(MovieViewModel.init)
            self.loadingState = .success
            
        } catch {
            print(error)
            self.loadingState = .failed
        }
    }
}

