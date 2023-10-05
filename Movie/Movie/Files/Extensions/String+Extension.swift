//
//  String+Extension.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-30.
//

import Foundation

extension String {
    
    func trimmedAndEscaped() -> String {
        let trimmedString = self.trimmingCharacters(in: .whitespacesAndNewlines)
        return trimmedString.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
    
}
