//
//  CarDetailCarImgTableViewCell.swift
//  GoGet
//
//  Created by Wai Phyo on 7/11/21.
//

import UIKit

class CarDetailCarImgTableViewCell: UITableViewCell, NibableCellProtocol {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var currentIndexIndicatorView: UIView!
    @IBOutlet weak var pagingStackView: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initial()
    }
    
    private func initial() {
        pagingStackView.subviews.forEach { aView in
            aView.layer.cornerRadius = 4
        }
        
        currentIndexIndicatorView.layer.cornerRadius = 4
        collectionView.isPagingEnabled = true
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

//MARK: - Collection datasource & delegates.
extension CarDetailCarImgTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: CarDetailCarImgCollectionViewCell.CELL_IDENTIFIER, for: indexPath) as? CarDetailCarImgCollectionViewCell else { return UICollectionViewCell() }
        
        cell.imgView.image = UIImage(named: "car\(indexPath.row)")
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return collectionViewLayout.collectionView?.frame.size ?? collectionView.frame.size
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let maxCount = pagingStackView.subviews.count-1
        let raw = min(CGFloat(maxCount), max(0, scrollView.contentOffset.x / scrollView.frame.size.width))
        let translationX = (8 + pagingStackView.spacing) * raw
        
        currentIndexIndicatorView.transform = CGAffineTransform(translationX: translationX, y: 0)
    }
}

class CarDetailCarImgCollectionViewCell: UICollectionViewCell, NibableCellProtocol {
    @IBOutlet weak var imgView: UIImageView!
}
