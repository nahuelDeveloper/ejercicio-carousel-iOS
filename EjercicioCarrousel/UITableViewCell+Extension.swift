//
//  UITableViewCell+Extension.swift
//  EjercicioCarrousel
//
//  Created by Gonza on 22/5/17.
//  Copyright © 2017 Nahuel. All rights reserved.
//

import Foundation

import UIKit

//1 protocol declaration
protocol Reusable {}

//2 protocol extension
extension Reusable where Self: UITableViewCell  {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

//3 conforming to protocol
extension UITableViewCell: Reusable {}
