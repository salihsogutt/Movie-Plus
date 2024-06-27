//
//  TVSeriesCollectionViewCell.swift
//  MoviePlus
//
//  Created by salih söğüt on 22.06.2024.
//

import UIKit
import Kingfisher

class TVSeriesCollectionViewCell: UICollectionViewCell {
 
    @IBOutlet weak var tvSeriesImage: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    static let reuseId = "tvSeriesCell"
    
    var tvMovie: Movie? {
        didSet {
            tvSeriesImage.kf.setImage(with: URL(string: NetworkCommon.imageBaseUrl + (tvMovie?.posterPath ?? "" )))
            labelName.text = tvMovie?.name ?? ""
        }
    }
}
