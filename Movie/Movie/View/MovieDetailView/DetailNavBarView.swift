//
//  DetailNavBarView.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-10-03.
//

import SwiftUI

struct DetailNavBarView: View {
    let movieDetailsView: MovieDetailsModel
    var body: some View {
        HStack (spacing: 10){
            Image.CalendarIcon
            Text(movieDetailsView.releaseDate)
            Text(" | ")
            Image.ClockIcon
            Text("167 Min")
            Text(" | ")
            Image.GenreIcon
            Text("Action")
            Text(" | ")
        }
        .foregroundColor(.AppGrayColor2)
    }
}

struct DetailNavBarView_Previews: PreviewProvider {
    static var previews: some View {
        DetailNavBarView(movieDetailsView: Movie.detailsMovie)
    }
}
