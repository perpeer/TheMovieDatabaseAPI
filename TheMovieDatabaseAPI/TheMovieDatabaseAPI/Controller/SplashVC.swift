//
//  SplashVC.swift
//  TheMovieDatabaseAPI
//
//  Created by Ekrem TAŞKIRAN on 9.01.2022.
//

import UIKit

final class SplashVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            Coordinator.shared.push(controller: .mainVC)
        }
    }
}
