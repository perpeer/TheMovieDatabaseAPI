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
    private var disposal = Disposal()
    
    // MARK: - Override Fuctions
    override func setupUI() {
        super.setupUI()
        navigationController?.removeViewController(SplashVC.self)
        navigationItem.setHidesBackButton(true, animated: true)
        bindUI()
        viewModel.fetchResponse()
    }
    
    // MARK: - Private Functions
    private func bindUI() {
        viewModel.state.observe { [weak self] state in
            if case .success = state {
                guard let self = self else { return }
                self.collectionView.reloadData()
            }
        }.add(to: &disposal)
    }
}
