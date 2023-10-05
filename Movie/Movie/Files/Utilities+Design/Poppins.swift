//
//  Poppins.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-23.
//

import Foundation

enum Poppins: String {
    
    case black, bold, light, medium, regular, semiBold
    
    var fontName: String {
        "Poppins-\(self.rawValue.capitalized)" // will return the name like Poppins-Black
    }
}

