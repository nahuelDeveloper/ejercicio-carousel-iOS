//
//  Carousel.swift
//  EjercicioCarrousel
//
//  Created by Gonza on 22/5/17.
//  Copyright © 2017 Nahuel. All rights reserved.
//

import Foundation

struct Carousel {
    
    var title   : String
    var type    : String
    var items   : [CarouselItem]
    
    init(json: [String: Any]) {
        
        if let _title = json["title"] as? String {
            title = _title
        } else {
            title = ""
        }
        
        if let _type = json["type"] as? String {
            type = _type
        } else {
            type = ""
        }
        
        items = [CarouselItem]()
        
        if let jsonItems = json["Items"] as? [[String: Any]] {
            
            for jsonItem in jsonItems {
                items.append(CarouselItem(json: jsonItem))
            }
        }
    }
}
