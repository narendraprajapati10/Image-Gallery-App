//
//  ImageListVC.swift
//  Image Gallery App
//
//  Created by WhyQ on 28/09/24.
//

import UIKit


class ImageListVC: UIViewController {

    private let viewModel = ImageViewModel()
    @IBOutlet weak var collectionView: UICollectionView!
    private let spacing:CGFloat = 5.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "List"
        initViewModel()
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
        self.collectionView?.collectionViewLayout = layout

    }

    func initViewModel() {
        viewModel.delegate = self
        viewModel.fetchImages()
    }

}


extension ImageListVC: ImageServices {

    func reloadData() {
       self.collectionView.reloadData()
    }
    
}

extension ImageListVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.imageList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewListCell", for: indexPath) as! ImageCollectionViewListCell
        cell.setupImage(data: viewModel.imageList[indexPath.row])
        return cell
    }
}

extension ImageListVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let numberOfItemsPerRow:CGFloat = 3
            let spacingBetweenCells:CGFloat = 5
            
            let totalSpacing = (3 * self.spacing) + ((numberOfItemsPerRow - 1) * spacingBetweenCells) //Amount of total spacing in a row
            
            if let collection = self.collectionView{
                let width = (collection.bounds.width - totalSpacing)/numberOfItemsPerRow
                return CGSize(width: width, height: width)
            }else{
                return CGSize(width: 0, height: 0)
            }
        }
}

extension ImageListVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(viewModel.imageList[indexPath.row].url)
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ImageDetailVC") as? ImageDetailVC
        vc?.imageList = viewModel.imageList
        self.navigationController?.pushViewController(vc!, animated: true)

    }
}

