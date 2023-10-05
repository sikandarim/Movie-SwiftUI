//
//  MovieDetailsDescriptionView.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-10-03.
//

import SwiftUI

struct MovieDetailsDescriptionView: View {
    let movieDetailsView: MovieDetailsModel
    var body: some View {
        VStack {
            Text("Description:")
                .poppins(.bold,20)
                .padding(.vertical, -5)
            
            Text(movieDetailsView.description)
                .poppins(.light,15)
                .multilineTextAlignment(.leading)
                .layoutPriority(1)
                .padding()
        }
       
    }
}

struct MovieDetailsDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsDescriptionView(movieDetailsView: Movie.detailsMovie)
    }
}
