//
//  CarouselTableCell.swift
//  EjercicioCarrousel
//
//  Created by Gonza on 22/5/17.
//  Copyright © 2017 Nahuel. All rights reserved.
//

import UIKit

enum CarouselCollectionCellType: String {
    case thumb = "thumb"
    case poster = "poster"
}

final class CarouselTableCell: UITableViewCell {
    
    // MARK: - Outlets -
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Attributes -
    var carousel: Carousel!
    var collectionCellType: CarouselCollectionCellType!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerUICollectionViewCell(CarouselThumbCollectionCell.self)
        collectionView.registerUICollectionViewCell(CarouselPosterCollectionCell.self)
    }
    
    func configureWithCarousel(carousel: Carousel) {
        self.carousel = carousel
        
        
    }
}

extension CarouselTableCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carousel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if carousel.type == CarouselCollectionCellType.poster.rawValue {
            // Poster
            let cell = collectionView.dequeueReusableCellUICollectionViewCell(forIndexPath: indexPath) as CarouselPosterCollectionCell
            cell.backgroundColor = UIColor.blue
            return cell
            
        } else {
            // Thumb
            let cell = collectionView.dequeueReusableCellUICollectionViewCell(forIndexPath: indexPath) as CarouselPosterCollectionCell
            cell.backgroundColor = UIColor.red
            return cell
            
        }
    }
}
