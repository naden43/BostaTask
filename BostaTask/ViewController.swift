//
//  ViewController.swift
//  BostaTask
//
//  Created by Naden on 03/02/2025.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            }

    override func viewDidAppear(_ animated: Bool) {
        let profile = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        profile.modalPresentationStyle = .fullScreen
        self.present(profile, animated: false, completion: nil)
    }

}

