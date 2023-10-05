//
//  View.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-23.
//

import Foundation
import SwiftUI

extension View {
    func poppins(_ font: Poppins, _ size:CGFloat = 14) -> some View {
        self.font(.custom(font.fontName, size: size))
    }
    
    var screenWidth: CGFloat {
        UIScreen.main.bounds.width
    }
    
    var screenHeight: CGFloat {
        UIScreen.main.bounds.height
    }
    
    func embedNavigationView() -> some View {
        return NavigationView { self }
    }
    
    
}
