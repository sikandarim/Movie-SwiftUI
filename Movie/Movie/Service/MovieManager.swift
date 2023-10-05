//
//  MovieManager.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-21.
//

import Foundation


class MovieService:MovieServiceType {

    func fetchMovies(from endpoint: MovieEndPoint) async throws -> MovieResponse {
        guard let url = URL(string: Constants.apiBaseUrl + endpoint.rawValue) else {
            throw NetworkError.invalidUrl
        }
      
        let movieResponse: MovieResponse = try await self.loadURLAndDecode(url: url)
        return movieResponse
        
    }
 
    
    //Details Movie
    func fetchMovie(id: Int) async throws -> Movie {
        guard let url = URL(string:Constants.apiBaseUrl + "movie/\(id)") else {
            throw  NetworkError.invalidPath
           
        }
        return try await  self.loadURLAndDecode(url: url, params: [
            "append_to_response": "videos,credits"
        ])
    }
    
    
    //Search Movie
    func searchMovie(query: String) async throws -> MovieResponse {
        guard let url = URL(string: Constants.apiBaseUrl + "/search/movie") else {
            throw  NetworkError.invalidPath
            
        }
        return try await self.loadURLAndDecode(url: url, params: [
            "language": "en-US",
            "include_adult": "false",
            "region": "US",
            "query": query
        ])
    }
    
    private func loadURLAndDecode<D: Decodable>(url: URL, params: [String: String]? = nil) async throws -> D {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
          throw  NetworkError.invalidPath
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: Constants.apiKey)]
        if let params = params {
            queryItems.append(contentsOf: params.map { URLQueryItem(name: $0.key, value: $0.value) })
        }
        
        urlComponents.queryItems = queryItems
        
        guard let finalURL = urlComponents.url else {
            throw  NetworkError.invalidPath
        }
       
        let (data, response) = try await URLSession.shared.data(from: finalURL)
        
        guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
            throw NetworkError.invalidResponse
        }
         
        return try Utils.jsonDecoder.decode(D.self, from: data)
  
    }
    
}
