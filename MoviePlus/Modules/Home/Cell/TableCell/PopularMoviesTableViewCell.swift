//
//  PopularMoviesTableViewCell.swift
//  MoviePlus
//
//  Created by salih söğüt on 22.06.2024.
//

import UIKit

protocol PopularMoviesTableViewCellProtocol: AnyObject {
    func didSelectItem(movie: Movie)
}


class PopularMoviesTableViewCell: UITableViewCell {
    
    weak var delegate: PopularMoviesTableViewCellProtocol?
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    static let reuseId = "popularMovies"
    
    var moviesList: [Movie]?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        configureCollectionView()
        collectionView.reloadData()
    }

    func configureCollectionView(){
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 10)
        layout.scrollDirection = .horizontal
        
        let itemWidth = 180
        let itemHeight = 200
        
        layout.itemSize = CGSize(width: itemWidth, height: itemHeight)
        collectionView.collectionViewLayout = layout
    }

}


extension PopularMoviesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moviesList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularMoviesCollectionViewCell.reuseId, for: indexPath) as! PopularMoviesCollectionViewCell
        let movie = moviesList?[indexPath.item]
        cell.movie = movie
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let movie = moviesList?[indexPath.item] {
            delegate?.didSelectItem(movie: movie)
        }
        
    }
    
}
