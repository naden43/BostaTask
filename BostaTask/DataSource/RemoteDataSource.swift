//
//  RemoteDataSource.swift
//  BostaTask
//
//  Created by Naden on 05/02/2025.
//

import Foundation
import Moya

class NetworkManager: RemoteDataSourceProtocol {


    let provider = MoyaProvider<APIService>()
    static let sharedInstance = NetworkManager()
    private init(){}

    func fetchData<T: Decodable>(endPoint: APIService, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
            
            provider.request(endPoint) { result in
                switch result {
                case .success(let response):
                    do {
                        let data = try response.map(T.self)
                        completion(.success(data))
                    } catch {
                        completion(.failure(error))
                    }
                    
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
}

