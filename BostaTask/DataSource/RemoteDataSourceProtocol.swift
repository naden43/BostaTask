//
//  RemoteDataSourceProtocol.swift
//  BostaTask
//
//  Created by Naden on 05/02/2025.
//

import Foundation

protocol RemoteDataSourceProtocol {
    func fetchData<T: Decodable>(endPoint: String, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void)
}
