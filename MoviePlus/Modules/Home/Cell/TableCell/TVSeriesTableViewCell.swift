//
//  TVSeriesTableViewCell.swift
//  MoviePlus
//
//  Created by salih söğüt on 22.06.2024.
//

import UIKit

protocol TVSeriesTableViewCellProtocol: AnyObject {
    func didSelectItem(movie: Movie)
}

class TVSeriesTableViewCell: UITableViewCell {
    
    weak var delegate: TVSeriesTableViewCellProtocol?

    @IBOutlet weak var collectionView: UICollectionView!
    
    static var reuseId = "tvSeries"
    
    var tvList: [Movie]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        
        registerCell()
        
        configureCollectionViewLayout()
    }

    
    func registerCell() {
        collectionView.register(
            UINib(nibName: "TVSeriesCell", bundle: nil),
            forCellWithReuseIdentifier: TVSeriesCollectionViewCell.reuseId
        )
    }
    
    func configureCollectionViewLayout(){
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        layout.scrollDirection = .horizontal
        
        let itemWidth = 120
        let itemHeight = 180
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        collectionView.collectionViewLayout = layout
    }
}

extension TVSeriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tvList?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TVSeriesCollectionViewCell.reuseId, for: indexPath) as! TVSeriesCollectionViewCell
        let tvMovie = tvList?[indexPath.item]
        cell.tvMovie = tvMovie
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let movie = tvList?[indexPath.item] {
            delegate?.didSelectItem(movie: movie)
        }
        
    }
}
