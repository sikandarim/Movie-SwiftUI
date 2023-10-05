//
//  MovieViewModel.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-10-01.
//

import Foundation


struct MovieViewModel: Identifiable {
    
    let movie: Movie
    
    var id: Int {
        return movie.id
    }
    var title: String {
        return movie.title ?? ""
    }
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? movie.backdropPath ?? "")")!
    }
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(movie.backdropPath ?? movie.posterPath ?? "")")!
    }
    var year: String {
        return movie.yearText
        
    }
    
    
}
