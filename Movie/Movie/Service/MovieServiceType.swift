//
//  MovieService.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-21.
//

import Foundation

protocol MovieServiceType {
    func fetchMovies(from endpoint: MovieEndPoint) async throws -> MovieResponse
    func fetchMovie(id: Int) async throws -> Movie
    func searchMovie(query: String) async throws -> MovieResponse
}

enum MovieEndPoint : String, CaseIterable {
    case nowPlaying = "movie/now_playing"
    case  topRated = "movie/top_rated"
    case  popular = "movie/popular"
    case  upcoming = "movie/upcoming"
    

}


enum NetworkError: Error {
    case invalidPath, invalidUrl, apiError, invalidResponse, noData, serializationError, unsupportedImage
    
}




