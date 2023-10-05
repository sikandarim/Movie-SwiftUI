//
//  Movie+Stub.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-23.
//

import Foundation

extension Movie {
    
    static var stubbedMovies: [Movie] {
        let response: MovieResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "movie_list")
       
        return response!.results
    }
    
    static var stubbedMovie: Movie {
        stubbedMovies[0]
    }
    
    static var loadMovieList : [MovieViewModel] {
        let movieList : MovieResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "movie_list")
        return (movieList?.results.map(MovieViewModel.init))!
    }

    static var loadMovie:MovieViewModel {
        return loadMovieList[0]
   }
    
    static var detailsMovie: MovieDetailsModel {
        let movie : Movie? = try? Bundle.main.loadAndDecodeJSON(filename: "movie_info")
        return MovieDetailsModel(movie: movie!)
        
    }
   

    
}

extension Bundle {
    
    func loadAndDecodeJSON<D: Decodable>(filename: String) throws -> D? {
        guard let url = self.url(forResource: filename, withExtension: "json") else {
            return nil
        }
        let data = try Data(contentsOf: url)
        let jsonDecoder = Utils.jsonDecoder
        let decodedModel = try jsonDecoder.decode(D.self, from: data)
        return decodedModel
    }
}


