//
//  MovieDetailModel.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-10-01.
//

import Foundation

struct MovieDetailsModel: Identifiable {
    
    var id: Int
    var title: String
    var posterURL: URL
    var backdropURL : URL
    var releaseDate: String
    var description: String
    var voteCount: Int
    var cast: [MovieCast]?
    var crew: [MovieCrew]?
    var directors: [MovieCrew]?
    var producers: [MovieCrew]?
    var screenWriters: [MovieCrew]?
    var youtubeTrailers: [MovieVideo]?
  
    init(movie:Movie) {
        self.id = movie.id
        self.title = movie.title ?? ""
        self.posterURL = movie.posterURL
        self.backdropURL = movie.backdropURL
        self.releaseDate = movie.yearText
        self.description = movie.overview
        self.voteCount = movie.voteRate
        self.cast = movie.cast
        self.crew = movie.crew
        self.directors = movie.directors
        self.producers = movie.producers
        self.screenWriters = movie.screenWriters
        self.youtubeTrailers = movie.youtubeTrailers
    }
    
    
    
 
}
