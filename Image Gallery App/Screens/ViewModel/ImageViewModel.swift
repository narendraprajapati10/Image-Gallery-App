//
//  ImageViewModel.swift
//  Image Gallery App
//
//  Created by WhyQ on 28/09/24.
//

import Foundation

protocol ImageServices: AnyObject {
    func reloadData() // Data Binding - PROTOCOL (View and ViewModel Communication)
}

class ImageViewModel {

    var imageList: [ImageModel] = [] { // When imageList instance update it will call delegate method to reload data
        didSet {
            self.delegate?.reloadData()
        }
    }
    
    private let manager = APIManager() // Dependancy Injuction using property method
    weak var delegate: ImageServices?

    // @MainActor -> DispatchQueue.Main.async
    @MainActor func fetchImages() {
        Task {
            do {
                let imageResponseArray: [ImageModel] = try await manager.request(url: imageURL)
                    self.imageList = imageResponseArray
            }catch {
                print(error)
            }
        }

    }
}
