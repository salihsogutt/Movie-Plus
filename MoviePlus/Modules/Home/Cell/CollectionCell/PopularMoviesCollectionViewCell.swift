//
//  PopularMoviesCollectionViewCell.swift
//  MoviePlus
//
//  Created by salih söğüt on 22.06.2024.
//

import UIKit
import Kingfisher

class PopularMoviesCollectionViewCell: UICollectionViewCell {    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    static let reuseId = "popularcollectioncell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layoutIfNeeded()
        movieImage.layer.cornerRadius = 30
        movieImage.layer.masksToBounds = false
        movieImage.clipsToBounds = true
    }
    
    var movie: Movie? {
        didSet {
            movieImage.kf.setImage(with: URL(string: NetworkCommon.imageBaseUrl + (movie?.backdropPath ?? "" )))
            nameLabel.text = movie?.title ?? ""
        }
    }
}


