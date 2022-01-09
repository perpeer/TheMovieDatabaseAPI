//
//  MovieDetailVC.swift
//  TheMovieDatabaseAPI
//
//  Created by Ekrem TAŞKIRAN on 9.01.2022.
//

import UIKit

final class MovieDetailVC: BaseVC {
    // MARK: - IBOutlets
    @IBOutlet private weak var imageViewIcon: UIImageView!
    @IBOutlet private weak var stackViewInfo: UIStackView! {
        didSet {
            stackViewInfo.isLayoutMarginsRelativeArrangement = true
            stackViewInfo.layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
        }
    }
    @IBOutlet private weak var labelLanguage: UILabel!
    @IBOutlet private weak var labelDate: UILabel!
    @IBOutlet private weak var labelOverview: UILabel! {
        didSet {
            labelOverview.numberOfLines = 0
        }
    }
    // MARK: - Propreties
    private var viewModel: TvPopulerItemVM? {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Override Fuctions
    override func setupUI() {
        super.setupUI()
        assignData()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func updateUI() {
        super.updateUI()
        guard let viewModel = viewModel else {
            return
        }
        title = viewModel.name
        imageViewIcon.sd_setImage(with: viewModel.iconUrl)
        labelOverview.text = viewModel.overviewText
        labelLanguage.text = viewModel.language
        labelDate.text = viewModel.firstAirDate
    }
    
    // MARK: Private Functions
    private func assignData() {
        if let data = data as? TvPopulerItemVM {
            viewModel = data
        }
    }
}
