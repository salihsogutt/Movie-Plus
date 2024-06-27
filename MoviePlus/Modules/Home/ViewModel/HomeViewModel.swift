//
//  View.swift
//  MoviePlus
//
//  Created by salih söğüt on 20.06.2024.
//

import Foundation
import FirebaseAuth

protocol HomeViewModelProtocol: AnyObject  {
    func reloadTablewView()
    func showAlert(message: String)
}

class HomeViewModel{
    
    var popularMovies = [Movie]()
    var tvMovies = [Movie]()
    
    weak var delegate: HomeViewModelProtocol?
    
    func getPopularMovies(){
        NetworkManager.shared.fetch(
            endpoint: "/3/movie/popular",
            method: .get,
            type: Movies.self
        ) { response in
            switch response {
            case .success(let success):
                DispatchQueue.main.async {
                    self.popularMovies = success.results ?? []
                    self.delegate?.reloadTablewView()
                
                }
            case .failure(let failure):
                self.delegate?.showAlert(message: failure.localizedDescription)
                break
            }
        }
    }
    
    func getTvMovies(){
        NetworkManager.shared.fetch(
            endpoint: "/3/trending/tv/day",
            method: .get,
            type: Movies.self
        ) { response in
            switch response {
            case .success(let success):
                DispatchQueue.main.async {
                    self.tvMovies = success.results ?? []
                    self.delegate?.reloadTablewView()
                
                }
            case .failure(let failure):
                //self.delegate?.showAlert(message: failure.localizedDescription)
                break
            }
        }
    }}
