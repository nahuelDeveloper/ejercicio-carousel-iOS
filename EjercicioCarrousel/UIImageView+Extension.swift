//
//  UIImageView+Extension.swift
//  EjercicioCarrousel
//
//  Created by Gonza on 22/5/17.
//  Copyright © 2017 Nahuel. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func loadImageFromResource(resource: String) {
        if let url = URL(string: resource) {
            self.kf.setImage(
                with: url,
                placeholder: nil,
                options: [.transition(.fade(0.2))],
                progressBlock: nil,
                completionHandler: { (image, error, cache, url) in
                    if let _ = error {
                        print("Could not load resource")
                    }
            })
        }
    }
}
