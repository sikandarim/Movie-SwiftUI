//
//  FailedView.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-30.
//

import SwiftUI

struct FailedView: View {
    var body: some View {
        Image("oops")
            .ignoresSafeArea(.all)
            .preferredColorScheme(.dark)
            .padding()
            
    }
}

struct FailedView_Previews: PreviewProvider {
    static var previews: some View {
        FailedView()
    }
}
