//
//  MainVC.swift
//  TheMovieDatabaseAPI
//
//  Created by Ekrem TAŞKIRAN on 9.01.2022.
//

import UIKit

final class MainVC: BaseVC {
    // MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.backgroundColor = .clear
        }
    }
    
    // MARK: - Properties
    private let viewModel = TvPopularVM()
    
    // MARK: - Override Fuctions
    override func setupUI() {
        super.setupUI()
        navigationController?.removeViewController(SplashVC.self)
        navigationItem.setHidesBackButton(true, animated: true)
        viewModel.fetchResponse()
    }
}
