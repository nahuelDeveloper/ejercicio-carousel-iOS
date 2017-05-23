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
    
    static let defaultSize: CGSize = CGSize(width: 200.0, height: 90.0)
    
    func configure(with carouselItem: CarouselItem) {
        titleLabel.text = carouselItem.title
        thumbImageView.loadImageFromResource(resource: carouselItem.URL)
        
        if !carouselItem.isVideoAvailable {
            self.contentView.layer.borderWidth = 1.0
            self.contentView.layer.borderColor = UIColor.red.cgColor
        } else {
            self.contentView.layer.borderWidth = 1.0
            self.contentView.layer.borderColor = UIColor.green.cgColor
        }
    }
    
}
