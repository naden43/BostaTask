//
//  AlbumCollectionViewCell.swift
//  BostaTask
//
//  Created by Naden on 03/02/2025.
//

import UIKit
import Kingfisher

class AlbumCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoName: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setPhotoData(photoData:Photo){
        photoName.text = photoData.title
        let url = URL(string: photoData.thumbnailUrl)
        photoImage.kf.setImage(with: url , placeholder: UIImage(named: "photo2")) 
        
    }
    

    
}
