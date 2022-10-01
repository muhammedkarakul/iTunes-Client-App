//
//  MainViewController.swift
//  iTunes Client App
//
//  Created by Pazarama iOS Bootcamp on 1.10.2022.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        iTunesAPI.shared.fetchPodcasts() { response, error in
            if let _ = error {
                return
            }
            guard let _ = response else {
                return
            }
        }
    }
}

