//
//  MovieDetailsTest.swift
//  MovieTests
//
//  Created by Mariam Sikandari on 2023-10-05.
//

import XCTest
@testable import Movie
@MainActor
 class MovieDetails: XCTestCase {
     
     var movieDetailVM: MovieDetailViewModel!
     
     override func setUp()  {
         super.setUp()
         movieDetailVM = MovieDetailViewModel(movieService: MockWebService())
     }
     
     override func tearDown() {
          super.tearDown()
         movieDetailVM = nil
     }
     

     func testFetchMovieSuccessfully() async{
    
         await movieDetailVM.loadMovie(id: 338762)
         XCTAssertEqual(movieDetailVM.movieDetail?.title, "Bloodshot")
         
         
     }
     
     
  
}
