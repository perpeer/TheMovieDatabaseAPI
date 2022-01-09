//
//  PopularItemCell.swift
//  TheMovieDatabaseAPI
//
//  Created by Ekrem TAŞKIRAN on 9.01.2022.
//

import UIKit
import SDWebImage

final class PopularItemCell: BaseCollectionCell {
    // MARK: IBOutlets
    @IBOutlet private weak var imageViewIcon: UIImageView! {
        didSet {
            imageViewIcon.contentMode = .scaleToFill
        }
    }
    @IBOutlet private weak var labelTitle: UILabel! {
        didSet {
            labelTitle.textAlignment = .center
            labelTitle.textColor = .white
        }
    }
    @IBOutlet private weak var labelAverage: UILabel! {
        didSet {
            labelAverage.textAlignment = .center
            labelAverage.textColor = .white
        }
    }
    
    // MARK: - Properties
    var viewModel: TvPopulerItemVM? {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Override Functions
    override func setupUI() {
        super.setupUI()
        layer.cornerRadius = 20
    }
    
    override func updateUI() {
        super.updateUI()
        guard let viewModel = viewModel else {
            return
        }
        imageViewIcon.sd_setImage(with: viewModel.iconUrl)
        labelTitle.text = viewModel.name
        labelAverage.text = "\(viewModel.voteAverage)"
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageViewIcon.image = nil
        labelTitle.text = nil
        labelAverage.text = nil
    }
}
