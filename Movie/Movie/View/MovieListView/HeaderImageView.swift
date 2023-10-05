//
//  headerImageView.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-28.
//

import SwiftUI

struct HeaderImageView: View {
    
    let movies: [MovieViewModel]
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(movies) { movie in
                        NavigationLink(destination: MainMovieDetailsViewScreen(movieID: movie.id)){
                            MovieCard(movie: movie, type: .posterList)
                               
                        }
                    }
                }
            }
        }
    }
}

struct headerImageView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderImageView(movies:Movie.loadMovieList)
    }
}
