//
//  MovieSearchTest.swift
//  MovieTests
//
//  Created by Mariam Sikandari on 2023-10-05.
//
import XCTest
@testable import Movie
@MainActor
 class MovieSearchTest: XCTestCase {
     
     var movieSearchVM: MovieListViewModel!
     
     override func setUp()  {
         super.setUp()
         movieSearchVM = MovieListViewModel(movieService: MockWebService())
     }
     
     override func tearDown() {
          super.tearDown()
         movieSearchVM = nil
     }
     

     func testFetchMovieSuccessfully() async{
    
         await movieSearchVM.getSearchData(query: "batman")
         XCTAssertNotNil(movieSearchVM.movieSearchList)
         
         
     }
     
     
  
}
