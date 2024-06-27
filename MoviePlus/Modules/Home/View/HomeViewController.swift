//
//  HomeViewController.swift
//  MoviePlus
//
//  Created by salih söğüt on 20.06.2024.
//

import UIKit
import FirebaseAuth
import FirebaseAnalytics

class HomeViewController: UIViewController {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Analytics.logEvent("Screen Opened", parameters: ["Screen Name" : "Home Screen"])
        
        viewModel.delegate = self
        
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)

        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.getPopularMovies()
        viewModel.getTvMovies()
        
        tableView.register(UINib(nibName: "HomeSearchCell", bundle: nil), forCellReuseIdentifier: HomeSearchTableViewCell.reuseId)
        
    }
  
    
    static func show(from: UIViewController) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        from.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeProfileTableViewCell.reuseId) as! HomeProfileTableViewCell
            cell.nameLabel.text = User.instance.name ?? ""
            
            if let url = User.instance.profileUrl {
                cell.profilePhoto.kf.setImage(with: url)
            }            
            return cell
            
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeSearchTableViewCell.reuseId) as! HomeSearchTableViewCell
            cell.selectionStyle = .none
            cell.delegate = self
            return cell
            
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PopularMoviesTableViewCell.reuseId) as! PopularMoviesTableViewCell
            cell.moviesList = viewModel.popularMovies
            cell.delegate = self
            cell.collectionView.reloadData()
            return cell
           
        } else if indexPath.row == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier: TVSeriesTableViewCell.reuseId) as! TVSeriesTableViewCell     
            cell.tvList = viewModel.tvMovies
            cell.delegate = self
            cell.collectionView.reloadData()
            return cell
            
        }
                
        return UITableViewCell()
    }
}

extension HomeViewController: HomeViewModelProtocol{
    func reloadTablewView() {
        tableView.reloadData()
    }    
    func showAlert(message: String) {
        alertMessage(titleInput: "Error", messageInput: message)
    }
}


extension HomeViewController: PopularMoviesTableViewCellProtocol, TVSeriesTableViewCellProtocol {
    func didSelectItem(movie: Movie) {
        DetailViewController.show(from: self, movie: movie)
    }
}

extension HomeViewController: HomeSearchTableViewCellProtocol{
    func showSerachView() {
        SearchViewController.show(from: self)
    }
}
