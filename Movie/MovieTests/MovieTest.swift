//
//  MovieTest.swift
//  MovieTests
//
//  Created by Mariam Sikandari on 2023-10-05.
//

import XCTest
@testable import Movie


class MovieTest: XCTestCase {
    
    func testOne() {
        
       let movies = Movie.stubbedMovies
        let movieList = movies.map(MovieViewModel.init)
        let firstMovie = movieList[0].title
        
        XCTAssertEqual("Bloodshot", firstMovie)
        
    }
    
}
