//
//  CarouselPosterCollectionCell.swift
//  EjercicioCarrousel
//
//  Created by Gonza on 22/5/17.
//  Copyright © 2017 Nahuel. All rights reserved.
//

import UIKit

final class CarouselPosterCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(with carouselItem: CarouselItem) {
        titleLabel.text = carouselItem.title
    }
    
}
