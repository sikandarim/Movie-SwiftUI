//
//  MovieCard.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-24.
//

import SwiftUI

struct MovieCard: View {
    let movie: MovieViewModel
    var type : MovieCardType = .posterList
    var body: some View {
        CustomImageListView(itemWidth: itemWidth, itemHeight: itemHeight, movie: movie)
    }
}

struct MovieCard_Previews: PreviewProvider {
    static var previews: some View {
        MovieCard(movie: Movie.loadMovie)
    }
}

extension MovieCard {
    var itemWidth : CGFloat {
        screenWidth * type.widthPercent
    }
    var itemHeight : CGFloat {
        screenHeight * type.heightPercent
    }
}
