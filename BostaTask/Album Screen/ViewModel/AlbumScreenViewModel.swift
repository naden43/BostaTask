//
//  AlbumScreenViewModel.swift
//  BostaTask
//
//  Created by Naden on 05/02/2025.
//

import Foundation

class AlbumScreenViewModel {
    
    let networkManager: RemoteDataSourceProtocol?
    var albumId : String?
    var photos: [Photo]?
    var photosSignal : ()->Void = {}
    var userName : String?
    var filteredPhoto : [Photo]?
    
    init(networkManager: RemoteDataSourceProtocol?, albumId: String? , userName:String?) {
        self.networkManager = networkManager
        self.albumId = albumId
        self.userName = userName
    }
    
    func getPhotos(){
        networkManager?.fetchData(endPoint: .fetchPhotos(albumId: albumId ?? "1"), responseType: [Photo].self) { [weak self] result in
            switch result {
            case .success(let photos):
                self?.photos = photos
                self?.filteredPhoto = photos
                self?.photosSignal()
            case .failure(let error):
                print("Error fetching photos: \(error.localizedDescription)")
            }
        }
    }
    
    func filterPhotoDataByText(text:String) -> [Photo]{
        filteredPhoto?.removeAll()
        guard let photos = photos else {return []}
         filteredPhoto = photos.filter { photo in
             return photo.title.lowercased().contains(text.lowercased())
         }
        
        return filteredPhoto ?? []
    }
    
    
}
