//
//  MovieListScreen.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-28.
//

import SwiftUI

struct MovieListScreen: View {
    var title: String
    let movies: [MovieViewModel]
   
    var body: some View {
       
        VStack(alignment: .leading, spacing: 20) {
            Text(title)
            .poppins(.bold, 20)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(self.movies) { movie in
                        NavigationLink(destination: MainMovieDetailsViewScreen(movieID: movie.id)){
                            MovieCard(movie: movie, type: .gridList)
                        }
                    }
                }
            }
        }
      
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen(title: "Now Playing", movies:Movie.loadMovieList )
    }
}
