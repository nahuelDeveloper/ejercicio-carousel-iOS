//
//  ViewController.swift
//  EjercicioCarrousel
//
//  Created by Gonza on 22/5/17.
//  Copyright © 2017 Nahuel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var carousels = [Carousel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        guard let overlayFileURLString = Bundle.main.path(forResource: "carousel", ofType: "json") else {
            return
        }
        
        let overlayFileURL = URL(fileURLWithPath: overlayFileURLString)
        
        let data = try! Data(contentsOf: overlayFileURL)
        let object = try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
        
        if let arrayJson = object as? [[String: Any]] {
            for carouselJson in arrayJson {
                carousels.append(Carousel(json: carouselJson))
            }
        } else {
            print("Invalid JSON")
        }
        
        print("Tengo \(carousels.count) carousels")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
