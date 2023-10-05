//
//  MainPage.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-10-04.
//

import SwiftUI

struct MainPage: View {
    @AppStorage("isOnboarding") var isOnboarding: Bool = true
    var body: some View {
        VStack {
            if isOnboarding {
               Onboarding()
            } else {
                MovieTabView()
            }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
