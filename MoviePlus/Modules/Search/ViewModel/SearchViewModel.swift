//
//  SearchViewModel.swift
//  MoviePlus
//
//  Created by salih söğüt on 26.06.2024.
//

import Foundation

protocol SearchViewModelProtocol: AnyObject{
    func showAlert(message: String)
    func reloadTable()
}

class SearchViewModel {
    
    var movies: [Movie] = []
    
    weak var delegate: SearchViewModelProtocol?
    
    func getMovies(query: String) {
        NetworkManager.shared.fetch(endpoint: "/3/search/movie",method: .get, type: Movies.self, parameters: ["query": query]) { result in
            switch result {
            case .success(let success):
                self.movies = success.results ?? []
                self.delegate?.reloadTable()
            case .failure(let failure):
                self.delegate?.showAlert(message: failure.localizedDescription)
            }
        }
    }
}
