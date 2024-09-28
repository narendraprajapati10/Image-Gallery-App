//
//  ImageCollectionViewListCell.swift
//  Image Gallery App
//
//  Created by WhyQ on 28/09/24.
//

import UIKit

class ImageCollectionViewListCell: UICollectionViewCell {
    @IBOutlet weak var imageView: CustomImageView!
    
    func setupImage(data:ImageModel) {
        if let url = URL(string: data.url) {
            imageView.loadImage(from: url)
        }else {
            // use placeholder for the spinner which is loading if image not found
        }
        
        
    }
}
