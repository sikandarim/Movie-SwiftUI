//
//  MovieModel.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-21.
//

import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable {
    let id: Int
    let title: String?
    let backdropPath: String?
    let posterPath: String?
    let overview: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
    let releaseDate: String?
    let credits: MovieCredit?
    let videos: MovieVideoResponse?
    
    
    var backdropURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(backdropPath ?? "")")!
    }
    
    var posterURL: URL {
        return URL(string: "https://image.tmdb.org/t/p/w500\(posterPath ?? "")")!
    }
    
    var yearText: String {
        guard let releaseDate = self.releaseDate, let date = Utils.dateFormatter.date(from: releaseDate) else {
            return "n/a"
        }
        return Utils.yearFormatter.string(from: date)
    }
    
    var voteRate: Int {
        return Int(voteAverage)
    }
    
    var cast: [MovieCast]? {
        credits?.cast
    }

    var crew: [MovieCrew]? {
        credits?.crew
    }
    var directors: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "director" }
    }
    var producers: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "producer" }
    }
    
    var screenWriters: [MovieCrew]? {
        crew?.filter { $0.job.lowercased() == "story" }
    }
    
    var youtubeTrailers: [MovieVideo]? {
        videos?.results.filter { $0.youtubeURL != nil }
    }
   
}


struct MovieCredit: Codable {
    
    let cast: [MovieCast]
    let crew: [MovieCrew]
}

struct MovieCast: Codable, Identifiable {
    let id: Int
    let character: String
    let name: String
}

struct MovieCrew: Codable, Identifiable {
    let id: Int
    let job: String
    let name: String
}

struct MovieVideoResponse: Codable {
    
    let results: [MovieVideo]
}

struct MovieVideo: Codable, Identifiable {
    
    let id: String
    let key: String
    let name: String
    let site: String
    
    var youtubeURL: URL? {
        guard site == "YouTube" else {
            return nil
        }
        return URL(string: "https://youtube.com/watch?v=\(key)")
    }
}

