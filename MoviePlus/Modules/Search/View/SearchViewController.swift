//
//  SearchViewController.swift
//  MoviePlus
//
//  Created by salih söğüt on 26.06.2024.
//

import UIKit
import FirebaseAnalytics

class SearchViewController: UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    private var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Analytics.logEvent("Screen Opened", parameters: ["Screen Name" : "Search Screen"])
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.delegate = self
        
        self.title = "Movie Search"
        
        let searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.backgroundColor = .white
        searchBar.searchTextField.becomeFirstResponder()
        self.navigationItem.titleView = searchBar
    }
   
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else { return }
        viewModel.getMovies(query: query)
    }
    
    static func show(from: UIViewController) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchViewController")
        from.navigationController?.pushViewController(vc, animated: true)
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as! SearchTableViewCell
        let movie = viewModel.movies[indexPath.row]
        cell.movieTitle.text = movie.name ?? movie.title ?? ""
        cell.movieTitle.textColor = .white
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = viewModel.movies[indexPath.row]
        DetailViewController.show(from: self, movie: movie)
    }
}

extension SearchViewController: SearchViewModelProtocol{
    func showAlert(message: String) {
        alertMessage(titleInput: "ERROR", messageInput: message)
    }
    
    func reloadTable() {
        tableView.reloadData()
        view.endEditing(true)
    }
}
