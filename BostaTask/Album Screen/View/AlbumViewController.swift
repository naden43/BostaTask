//
//  AlbumViewController.swift
//  BostaTask
//
//  Created by Naden on 03/02/2025.
//

import UIKit

class AlbumViewController: UIViewController , UICollectionViewDelegate , UICollectionViewDataSource , UISearchBarDelegate{
    
    @IBOutlet weak var albumPhotos: UICollectionView!
    @IBOutlet weak var userAlbumName: UILabel!
    @IBOutlet weak var searchBar: UISearchBar!
    var viewModel : AlbumScreenViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let nib = UINib(nibName: "AlbumCollectionViewCell", bundle: nil)
        albumPhotos.register(nib, forCellWithReuseIdentifier: "albumPhotos")
        
        albumPhotos.dataSource = self
        albumPhotos.delegate = self
        
        viewModel?.getPhotos()
        viewModel?.photosSignal = { [weak self] in
            self?.userAlbumName.text = "\(self?.viewModel?.userName ?? "") Album"
            self?.albumPhotos.reloadData()
        }
        
        searchBar.delegate = self

    }

    init(viewModel: AlbumScreenViewModel? = nil) {
        super.init(nibName: "AlbumViewController", bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        print("bnb")
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.filteredPhoto?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "albumPhotos", for: indexPath) as? AlbumCollectionViewCell else { return UICollectionViewCell()}
        
        guard let photo = viewModel?.filteredPhoto?[indexPath.row] else {return UICollectionViewCell()}
        
        cell.setPhotoData(photoData: photo)
    
        return cell
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText == "" {
            viewModel?.filteredPhoto = viewModel?.photos
            albumPhotos.reloadData()
        }
        else {
            viewModel?.filterPhotoDataByText(text: searchText)
            albumPhotos.reloadData()
        }
    }

}
