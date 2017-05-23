//
//  CarouselItem.swift
//  EjercicioCarrousel
//
//  Created by Gonza on 22/5/17.
//  Copyright © 2017 Nahuel. All rights reserved.
//

import Foundation

struct CarouselItem {
    
    var title   : String
    var URL     : String
    var video   : String
    
    var isVideoAvailable: Bool {
        get {
            if video.characters.count == 0 {
                return false
            }
            return true
        }
    }
    
    init(json: [String: Any]) {
        
        if let _title = json["title"] as? String {
            title = _title
        } else {
            title = ""
        }
        
        if let _URL = json["URL"] as? String {
            URL = _URL
        } else {
            URL = ""
        }
        
        if let _video = json["video"] as? String {
            video = _video
        } else {
            video = ""
        }
    }
}
