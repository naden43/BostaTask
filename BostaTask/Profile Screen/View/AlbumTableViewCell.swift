//
//  AlbumTableViewCell.swift
//  BostaTask
//
//  Created by Naden on 03/02/2025.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var albumName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setCellData(albumName:String){
        self.albumName.text = albumName
    }
    
}
