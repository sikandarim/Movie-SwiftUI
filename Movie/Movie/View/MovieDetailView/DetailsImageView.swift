//
//  DetailsImageView.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-10-03.
//

import SwiftUI

struct DetailsImageView: View {
    let movieDetailsView: MovieDetailsModel
    var body: some View {
        ZStack(alignment: .leading) {
            ZStack(alignment: .top) {
                URLImage(url: movieDetailsView.posterURL)
                    .frame(width: screenWidth, height: posterImageHeight )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            HStack {
                URLImage(url: movieDetailsView.backdropURL)
                    .frame(width: backdropImageSize, height: backdropImageSize )
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                Text(movieDetailsView.title)
                    .poppins(.bold,20)
                    .minimumScaleFactor(0.5)
                    .padding(.top, titleOffset)
            }
            .padding()
            .offset(y: backdropImageOffset)
        }
    }
    var posterImageHeight: CGFloat {
        screenHeight * 0.35
    }
    var backdropImageSize: CGFloat {
        screenHeight * 0.22
    }
    var backdropImageOffset: CGFloat {
        screenHeight * 0.15
    }
    var titleOffset: CGFloat {
        screenHeight * 0.12
    }
}

struct DetailsImageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsImageView(movieDetailsView: Movie.detailsMovie)
    }
}
