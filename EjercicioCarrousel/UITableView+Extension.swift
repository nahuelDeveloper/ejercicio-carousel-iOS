//
//  UITableView+Extension.swift
//  EjercicioCarrousel
//
//  Created by Gonza on 22/5/17.
//  Copyright © 2017 Nahuel. All rights reserved.
//

import UIKit

extension UITableView {
    
    func registerUITableViewCell<T>(_ :T.Type) where T: Reusable, T: UITableViewCell {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }
    
    func dequeueReusableCellUITableViewCell<T>(forIndexPath indexPath: IndexPath) -> T where T: Reusable, T: UITableViewCell {
        
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not deque cell")
        }
        
        return cell
    }
}
