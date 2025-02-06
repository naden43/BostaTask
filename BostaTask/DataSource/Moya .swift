//
//  Moya .swift
//  BostaTask
//
//  Created by Naden on 06/02/2025.
//

import Moya
import Foundation

enum APIService {
    case fetchPhotos(albumId: String)
    case fetchAlbums(userId: String)
    case fetchUser(userId: String)
}

extension APIService: TargetType {
    
    var baseURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com/")!
    }
    
    var path: String {
        switch self {
        case .fetchPhotos(let albumId):
            return "albums/\(albumId)/photos"
        case .fetchAlbums(let userId):
            return "users/\(userId)/albums"
        case .fetchUser(let userId):
            return "users/\(userId)"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var sampleData: Data {
        return Data()
    }
}

