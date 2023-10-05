//
//  InfoDetailsView.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-10-03.
//

import SwiftUI

struct InfoDetailsView: View {
    
    let movieDetailsView: MovieDetailsModel
    var body: some View {
        VStack {
            HStack(alignment: .top, spacing: 4) {
                if movieDetailsView.cast != nil && movieDetailsView.cast!.count > 0 {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Starring")
                            .poppins(.bold, 18)
                        ForEach(self.movieDetailsView.cast!.prefix(9)) { cast in
                            Text(cast.name)
                                .poppins(.light,15)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Spacer()
                }
                if movieDetailsView.crew != nil && movieDetailsView.crew!.count > 0 {
                    VStack(alignment: .leading, spacing: 4) {
                        if movieDetailsView.directors != nil && movieDetailsView.directors!.count > 0 {
                            Text("Director(s)")
                                .poppins(.bold, 18)
                            ForEach(self.movieDetailsView.directors!.prefix(2)) { crew in
                                Text(crew.name)
                                    .poppins(.light,15)
                            }
                        }
                        if movieDetailsView.producers != nil && movieDetailsView.producers!.count > 0 {
                            Text("Producer(s)")
                                .poppins(.bold, 18)
                                .padding(.top)
                            ForEach(self.movieDetailsView.producers!.prefix(2)) { crew in
                                Text(crew.name)
                                    .poppins(.light,15)
                            }
                        }
                        if movieDetailsView.screenWriters != nil && movieDetailsView.screenWriters!.count > 0 {
                            Text("Screenwriter(s)")
                                .poppins(.bold, 18)
                                .padding(.top)
                            ForEach(self.movieDetailsView.screenWriters!.prefix(2)) { crew in
                                Text(crew.name)
                                    .poppins(.light,15)
                            }
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
            }
            .padding()
        }
    }
}

struct InfoDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        InfoDetailsView(movieDetailsView: Movie.detailsMovie)
    }
}
