//
//  CarouselPosterCollectionCell.swift
//  EjercicioCarrousel
//
//  Created by Gonza on 22/5/17.
//  Copyright © 2017 Nahuel. All rights reserved.
//

import UIKit

final class CarouselPosterCollectionCell: UICollectionViewCell {
    
    // MARK: - Outlets -
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(with carouselItem: CarouselItem) {
        titleLabel.text = carouselItem.title
        posterImageView.loadImageFromResource(resource: carouselItem.URL)
        
        if !carouselItem.isVideoAvailable {
            self.contentView.layer.borderWidth = 1.0
            self.contentView.layer.borderColor = UIColor.red.cgColor
        } else {
            self.contentView.layer.borderWidth = 1.0
            self.contentView.layer.borderColor = UIColor.green.cgColor
        }
    }
    
}
