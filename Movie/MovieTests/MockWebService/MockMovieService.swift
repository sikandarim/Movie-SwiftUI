//
//  MockMovieService.swift
//  MovieTests
//
//  Created by Mariam Sikandari on 2023-10-05.
//
//Bundle.main.loadAndDecodeJSON(filename: "movie_list")
import Foundation
class MockWebService: MovieServiceType {
    
    func fetchMovies(from endpoint: MovieEndPoint) async throws -> MovieResponse {

        let response: MovieResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "movie_list")
        return response!
    }
    
    func fetchMovie(id: Int) async throws -> Movie {
        let movie : Movie? = try? Bundle.main.loadAndDecodeJSON(filename: "movie_info")
        return movie!
    }
    
    func searchMovie(query: String) async throws -> MovieResponse {
        let response: MovieResponse? = try? Bundle.main.loadAndDecodeJSON(filename: "search_movie")
        return response!
    }
    
   
}

