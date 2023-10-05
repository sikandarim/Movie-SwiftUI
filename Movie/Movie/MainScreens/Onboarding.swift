//
//  Onboarding.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-10-04.
//

import SwiftUI

struct Onboarding: View {
    
    @AppStorage("isOnboarding") var isOnboarding:Bool?
    var body: some View {
        
        ZStack {
            Image("movie")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            VStack {
                Spacer()
                Button {
                    isOnboarding = false
                    } label: {
                        Text("Start")
                            .poppins(.bold,30)
                            .padding(.horizontal, 150)
                            .padding(.vertical, 30)
                            .foregroundColor(.black)
                            .background(.tint)
                            .cornerRadius(8)
                    }
                .padding(.bottom, 100)
            }
        }
   
   }
}

struct Onboarding_Previews: PreviewProvider {
    static var previews: some View {
        Onboarding()
    }
}
