//
//  Optional.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-26.
//

import Foundation

extension Optional where Wrapped == String {
    var stringValue: String {
        guard let self = self else { return "" }
        return self
    }
}
