//
//  MovieListTests.swift
//  MovieTests
//
//  Created by Mariam Sikandari on 2023-10-05.
//

import XCTest
@testable import Movie
@MainActor
 class MovieListTests: XCTestCase {
     
     var movieListVM: MovieListViewModel!
     
     override func setUp()  {
         super.setUp()
         movieListVM = MovieListViewModel(movieService: MockWebService())
     }
     
     override func tearDown() {
          super.tearDown()
         movieListVM = nil
     }
     

     func testFetchMovieSuccessfully() async{
    
         await movieListVM.getData(with: .popular)
         
        XCTAssertEqual(movieListVM.movieList.count, 20)
         
         
     }
     
     
  
}
