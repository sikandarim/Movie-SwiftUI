//
//  MovieDetail.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-30.
//

import SwiftUI

struct MovieDetailsView: View {
    let movieDetailsView: MovieDetailsModel
    @State private var selectedTrailer: MovieVideo?
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                DetailsImageView(movieDetailsView: movieDetailsView)
                VStack {
                    DetailNavBarView(movieDetailsView: movieDetailsView)
                    RatingView(rating: .constant(movieDetailsView.voteCount ))
                            .padding(.top)
                        Divider()
                        .background(Color.white)
                        .padding(.top)
                    MovieDetailsDescriptionView(movieDetailsView: movieDetailsView)
                        .padding(.top)
                        Divider()
                       .background(Color.white)
                    InfoDetailsView(movieDetailsView: movieDetailsView)
                    Divider()
                   .background(Color.white)
                    VideoDetailsView(movieDetailsView: movieDetailsView, selectedTrailer: $selectedTrailer)
                    
               
                }
                .padding()
                .padding(.top, contentOffset)
            }
            .preferredColorScheme(.dark)
            .background(Color.AppBackgroundColor)
        
            
            
        }
        }


    var contentOffset: CGFloat {
        screenHeight * 0.10
    }

    }
    
struct MovieDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailsView(movieDetailsView: Movie.detailsMovie)
    }
}
