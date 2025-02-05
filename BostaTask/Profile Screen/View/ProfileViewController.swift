//
//  ProfileViewController.swift
//  BostaTask
//
//  Created by Naden on 03/02/2025.
//

import UIKit

class ProfileViewController: UIViewController  , UITableViewDelegate , UITableViewDataSource
{
    
    
    @IBOutlet weak var UserProfile: UILabel!
    @IBOutlet weak var userAlbums: UITableView!
    @IBOutlet weak var userAddress: UILabel!
    @IBOutlet weak var userName: UILabel!
    var viewModel:ProfileViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ProfileViewModel(networkManager: NetworkManager.sharedInstance)
        viewModel?.getUserData(userId: "1")
        viewModel?.userDataSignal = { [weak self] in
            self?.UserProfile.text = "\(self?.viewModel?.user?.name ?? "") profile"
            self?.userAddress.text = "\(self?.viewModel?.user?.address.street ?? "") -  \((self?.viewModel?.user?.address.city ?? ""))"
            self?.userName.text = self?.viewModel?.user?.email
            
        }
        
        
        let nib = UINib(nibName: "AlbumTableViewCell", bundle: nil)
        userAlbums.register(nib, forCellReuseIdentifier: "album")
        
        userAlbums.delegate = self
        userAlbums.dataSource = self
        
        viewModel?.getUserAlbums(userId: "1")
        viewModel?.albumsSignal = {
            self.userAlbums.reloadData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.albums?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "album", for: indexPath) as? AlbumTableViewCell else { return UITableViewCell()}
        
        cell.setCellData(albumName: viewModel?.albums?[indexPath.row].title ?? "album")
        
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let album = AlbumViewController(viewModel: AlbumScreenViewModel(networkManager: NetworkManager.sharedInstance, albumId: String(viewModel?.albums?[indexPath.row].id ?? 1), userName: viewModel?.user?.name ?? ""))
        
        album.modalPresentationStyle = .fullScreen
        
        self.present(album, animated: true, completion: nil)
    }


 

}
