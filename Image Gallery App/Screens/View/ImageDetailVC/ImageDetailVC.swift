//
//  ImageDetailVC.swift
//  Image Gallery App
//
//  Created by WhyQ on 28/09/24.
//

import UIKit

class ImageDetailVC: UIViewController {
    var imageList: [ImageModel] = []
    @IBOutlet weak var collectionView: UICollectionView!
    private let spacing:CGFloat = 5.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Detail View"
        configureCollectionView()
        // Do any additional setup after loading the view.
    }
    
    func configureCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .horizontal
        self.collectionView?.collectionViewLayout = layout

    }
}



extension ImageDetailVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        cell.setupData(data: imageList[indexPath.row])
        return cell
    }
}

extension ImageDetailVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if let collection = self.collectionView{
            let width = collection.bounds.width
            let height = collection.bounds.height
            return CGSize(width: width - 10, height: height)
        }else{
            return CGSize(width: 0, height: 0)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }
}

extension ImageDetailVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
}


