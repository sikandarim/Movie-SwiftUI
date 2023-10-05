//
//  MovieCardType.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-24.
//

import Foundation

enum MovieCardType {
    case posterList, gridList
}

extension MovieCardType {
    var widthPercent: Double {
        switch self {
        case .posterList :
            return 1.00
        case .gridList:
            return 0.30
  
        }
    }
    
    var heightPercent: Double {
        switch self {
        case .posterList :
            return 0.30
        case .gridList:
            return 0.15
   
            
        }
    }
}
