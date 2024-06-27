//
//  HomeSearchTableViewCell.swift
//  MoviePlus
//
//  Created by salih söğüt on 22.06.2024.
//

import UIKit

protocol HomeSearchTableViewCellProtocol: AnyObject{
    func showSerachView()
}

class HomeSearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var view: UIView!
    static let reuseId = "homeSearchCell"
    
    weak var delegate: HomeSearchTableViewCellProtocol?

    override func awakeFromNib() {
        super.awakeFromNib()
        
        view.layer.cornerRadius = 20
        
    }

    
    @IBAction func onSearch(_ sender: Any) {
        delegate?.showSerachView()
    }
}
