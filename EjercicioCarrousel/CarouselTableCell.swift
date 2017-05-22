//
//  CarouselTableCell.swift
//  EjercicioCarrousel
//
//  Created by Gonza on 22/5/17.
//  Copyright © 2017 Nahuel. All rights reserved.
//

import UIKit

final class CarouselTableCell: UITableViewCell {
    
    // MARK: - Outlets -
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Attributes -
    var carousel: Carousel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
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
        return UICollectionViewCell()
    }
}
