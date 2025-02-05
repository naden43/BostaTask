//
//  AlbumListModel.swift
//  BostaTask
//
//  Created by Naden on 05/02/2025.
//

import Foundation

struct Album: Decodable {
    let userId: Int
    let id: Int
    let title: String
}

struct Albums : Decodable {
    let albums:[Album]
}
