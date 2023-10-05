//
//  SearchMovieList.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-29.
//

import SwiftUI

struct SearchMovieList: View {
    let movies: [MovieViewModel]
    var body: some View {
        List(self.movies) { movie in
            NavigationLink(destination: MainMovieDetailsViewScreen(movieID: movie.id)) {
                SearchMovieCellView(movies: movie)
            }
        }
            .preferredColorScheme(.dark)
            .background(Color.AppBackgroundColor)
    }
}

struct SearchMovieList_Previews: PreviewProvider {
    static var previews: some View {
        SearchMovieList(movies: Movie.loadMovieList)
    }
}

struct SearchMovieCellView: View {
    let movies: MovieViewModel
    var body: some View {
        HStack(alignment: .top) {
            MovieCard(movie: movies, type: .gridList)

            VStack(alignment: .leading){
                Text(movies.title)
                    .poppins(.bold, 20)
                
                Text(movies.year)
                    .poppins(.medium, 20)
                    .opacity(0.5)
            }.padding(5)
         
        }.contentShape(Rectangle())
    }
}
