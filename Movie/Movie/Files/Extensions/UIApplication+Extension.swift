//
//  UIApplication.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-23.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
