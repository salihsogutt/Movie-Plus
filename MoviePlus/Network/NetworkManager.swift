//
//  NetworkManager.swift
//  MoviePlus
//
//  Created by salih söğüt on 21.06.2024.

import Foundation
import UIKit
import Alamofire

final class NetworkManager {
    
    static let shared = NetworkManager()
    private init(){}
    func fetch<T:Codable>(
        endpoint: String,
        method: HTTPMethod,
        type: T.Type,
        addBaseUrl: Bool = true,
        parameters: Parameters? = nil,
        completion: @escaping (Result<T,Error>) -> Void) {
            var apiURL: String
            if addBaseUrl {
                apiURL = NetworkCommon.url + endpoint
            } else {
                apiURL =  endpoint
            }
            
            let header = HTTPHeaders(["Authorization":"Bearer \(NetworkCommon.token)", "accept":"application/json"] )
            
            AF.request(apiURL, method: method, parameters: parameters, headers: header).response { response in
                if let data = response.data {
                    do {
                        let json = try JSONDecoder().decode(type, from: data)
                        completion(.success(json))
                    } catch (let error) {
                        completion(.failure(error))
                    }
                }else{
                    print("Data is null")
                }
            }
        }
}

