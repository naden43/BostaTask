//
//  ProfileViewModel.swift
//  BostaTask
//
//  Created by Naden on 05/02/2025.
//

import Foundation

class ProfileViewModel {
    
    let networkManager: RemoteDataSourceProtocol?
    var userDataSignal : ()->Void = {}
    var user: User?
    var albums: [Album]?
    var albumsSignal : ()->Void = {}
    
    
    init(networkManager: RemoteDataSourceProtocol?) {
        self.networkManager = networkManager
    }
    
    func getUserData(userId:String){
        
        networkManager?.fetchData(endPoint: "users/\(userId)", responseType: User.self) { [weak self] result in
            switch result {
            case .success(let user):
                self?.user = user
                self?.userDataSignal()
            case .failure(let error):
                print("Error fetching user: \(error.localizedDescription)")
            }
        }
        
    }
    
    func getUserAlbums(userId:String) {
        networkManager?.fetchData(endPoint: "users/\(userId)/albums", responseType: [Album].self) { [weak self] result in
            switch result {
            case .success(let albums):
                self?.albums = albums
                self?.albumsSignal()
            case .failure(let error):
                print(error)
            }
        }
    }
}
