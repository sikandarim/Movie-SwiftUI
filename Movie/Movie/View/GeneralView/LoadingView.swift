//
//  LoadingView.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-30.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        Image("loading")
            .resizable()
            .frame(width: 250,height: 260)
            .preferredColorScheme(.dark)
            .padding()
            
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
