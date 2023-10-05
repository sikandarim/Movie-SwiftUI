//
//  CustomImageView.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-24.
//

import SwiftUI

struct CustomImageListView: View {
    let itemWidth : CGFloat
    let itemHeight: CGFloat
    let movie: MovieViewModel
    
    var body: some View {
        URLImage(url: movie.posterURL)
        .frame(width: itemWidth, height: itemHeight)
        .clipShape(RoundedRectangle(cornerRadius: 15))
            
    }
}

struct CustomImageListView_Previews: PreviewProvider {
    static var previews: some View {
       
        CustomImageListView(itemWidth: 150.0, itemHeight: 150.0, movie: Movie.loadMovie)
    }
}
