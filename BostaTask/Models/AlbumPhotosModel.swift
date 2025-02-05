//
//  AlbumPhotosModel.swift
//  BostaTask
//
//  Created by Naden on 05/02/2025.
//

import Foundation

struct Photo: Decodable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

struct Photos: Decodable {
    let photos:[Photo]
}
