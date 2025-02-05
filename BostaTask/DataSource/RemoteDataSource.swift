//
//  RemoteDataSource.swift
//  BostaTask
//
//  Created by Naden on 05/02/2025.
//

import Foundation
import Alamofire

class NetworkManager: RemoteDataSourceProtocol {

    static let sharedInstance = NetworkManager()
    private init(){}
    let basicURL = "https://jsonplaceholder.typicode.com/"
    func fetchData<T: Decodable>(endPoint: String, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        let url = basicURL + endPoint
        AF.request(url, method: .get).validate().responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

