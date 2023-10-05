//
//  ViewModelBase.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-30.
//

import Foundation

@MainActor

enum LoadingState {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
    
}
