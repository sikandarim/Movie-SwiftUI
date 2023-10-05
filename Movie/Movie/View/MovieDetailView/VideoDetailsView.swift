//
//  VideoDetailsView.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-10-03.
//

import SwiftUI

struct VideoDetailsView: View {
    let movieDetailsView: MovieDetailsModel
    @Binding var selectedTrailer: MovieVideo?
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            if movieDetailsView.youtubeTrailers != nil && movieDetailsView.youtubeTrailers!.count > 0 {
                Text("Trailers").poppins(.bold, 18)
                
                ForEach(movieDetailsView.youtubeTrailers!) { trailer in
                    Button(action: {
                        self.selectedTrailer = trailer
                    }) {
                        HStack {
                            Text(trailer.name)
                                .foregroundColor(Color.AppGrayColor2)
                            Spacer()
                            Image(systemName: "play.circle.fill")
                                .foregroundColor(Color(UIColor.systemBlue))
                        }
                        
                    }
                }
            }
        }
        .sheet(item: self.$selectedTrailer) { trailer in
            SafariView(url: trailer.youtubeURL!)
        }
    }
}
