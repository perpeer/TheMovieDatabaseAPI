//
//  MovieDetailVC.swift
//  TheMovieDatabaseAPI
//
//  Created by Ekrem TAŞKIRAN on 9.01.2022.
//

import UIKit

final class MovieDetailVC: BaseVC {
    // MARK: - Propreties
    private var viewModel: TvPopulerItemVM?
    
    // MARK: - Override Fuctions
    override func setupUI() {
        super.setupUI()
        assignData()
        title = viewModel?.name
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    // MARK: Private Functions
    private func assignData() {
        if let data = data as? TvPopulerItemVM {
            viewModel = data
        }
    }
}
