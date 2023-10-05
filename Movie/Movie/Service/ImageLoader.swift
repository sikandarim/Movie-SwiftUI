//
//  ImageLoader.swift
//  Movie
//
//  Created by Mariam Sikandari on 2023-09-23.
//

import Foundation
import UIKit

@MainActor
class ImageLoader : ObservableObject {
    
    @Published var uiImage: UIImage?
    private static let cache = NSCache<NSString, UIImage>()
    
    func fetchImage(_ url: URL?) async throws {
        
        guard let url = url else {
            throw NetworkError.invalidUrl
        }
        
        let request = URLRequest(url: url)
        
        //Check in cache
        if let cachedImage = Self.cache.object(forKey: url.absoluteString as NSString) {
            uiImage = cachedImage
        } else {
            
            let (data, response ) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse,
                  httpResponse.statusCode == 200 else {
                throw NetworkError.invalidResponse
            }
            guard let image = UIImage(data: data) else {
                throw NetworkError.unsupportedImage
            }
            Self.cache.setObject(image, forKey: url.absoluteString as NSString)
            uiImage = image
        }
 
    }
}

