//
//  ConnectionManager.swift
//  EjercicioCarrousel
//
//  Created by Gonza on 23/5/17.
//  Copyright © 2017 Nahuel. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case NoCarouselData
    case InternetConnectionFailed
    
    func getErrorDescription() -> String {
        return "No carousel data available"
    }
}

struct ConnectionManager {
    
    static let sharedInstance = ConnectionManager()
    
    private init() {
        
    }
    
    func getCarrouselData(completion: (_ carousels: [Carousel]?, _ error: NetworkingError?) -> Void ) {
        
        guard let overlayFileURLString = Bundle.main.path(forResource: "carousel", ofType: "json") else {
            return
        }
        
        let overlayFileURL = URL(fileURLWithPath: overlayFileURLString)
        
        let data = try! Data(contentsOf: overlayFileURL)
        let object = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        
        var carousels = [Carousel]()
        
        if let arrayJson = object as? [[String: Any]] {
            for carouselJson in arrayJson {
                carousels.append(Carousel(json: carouselJson))
            }
            
            completion(carousels, nil)
            
        } else {
            
            completion(nil, NetworkingError.NoCarouselData)
            
        }
    }
}
