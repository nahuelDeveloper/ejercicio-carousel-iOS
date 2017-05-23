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

protocol CarouselTableCellDelegate: class {
    func displayNoVideoMessage()
    func playVideo(for carouselItem: CarouselItem)
}

final class CarouselTableCell: UITableViewCell {
    
    // MARK: - Outlets -
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Attributes -
    var carousel: Carousel!
    var collectionCellType: CarouselCollectionCellType!
    
    // MARK: - Delegate -
    weak var delegate: CarouselTableCellDelegate?
    
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
            cell.configure(with: carousel.items[indexPath.row])
            return cell
            
        } else {
            // Thumb
            let cell = collectionView.dequeueReusableCellUICollectionViewCell(forIndexPath: indexPath) as CarouselThumbCollectionCell
            cell.configure(with: carousel.items[indexPath.row])
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let carouselItem = carousel.items[indexPath.row]
        
        if carouselItem.isVideoAvailable {
            delegate?.playVideo(for: carouselItem)
        } else {
            delegate?.displayNoVideoMessage()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if carousel.type == CarouselCollectionCellType.poster.rawValue {
            return CGSize(width: 150.0, height: 200.0)
        } else {
            return CGSize(width: 200.0, height: 90.0)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(2.5, 5.0, 2.5, 5.0)
    }
    
}
