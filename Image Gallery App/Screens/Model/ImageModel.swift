//
//  ImageModel.swift
//  Image Gallery App
//
//  Created by WhyQ on 28/09/24.
//

import Foundation

struct ImageModel: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String       // URL for the image
    let thumbnailUrl: String

}
