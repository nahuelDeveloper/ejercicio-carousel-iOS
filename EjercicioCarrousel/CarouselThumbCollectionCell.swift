//
//  CarouselThumbCollectionCell.swift
//  EjercicioCarrousel
//
//  Created by Gonza on 22/5/17.
//  Copyright © 2017 Nahuel. All rights reserved.
//

import UIKit

final class CarouselThumbCollectionCell: UICollectionViewCell {
    
    // MARK: - Outlets -
    @IBOutlet weak var thumbImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(with carouselItem: CarouselItem) {
        titleLabel.text = carouselItem.title
    }
    
}
