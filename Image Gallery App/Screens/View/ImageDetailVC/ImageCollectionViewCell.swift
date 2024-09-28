//
//  ImageCollectionViewCell.swift
//  Image Gallery App
//
//  Created by WhyQ on 28/09/24.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: CustomImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    
    func setupData(data:ImageModel) {
        if let url = URL(string: data.url) {
            imageView.loadImage(from: url)
        }else {
            // use placeholder for the spinner which is loading if image not found
        }
        
        lblTitle.text = data.title
        lblDescription.text = "This is Static Data because I did not get Description in API Calling so I am setting dummy data to this description"
    }
}
