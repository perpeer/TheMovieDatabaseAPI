//
//  PopularItemCell.swift
//  TheMovieDatabaseAPI
//
//  Created by Ekrem TAŞKIRAN on 9.01.2022.
//

import UIKit

final class PopularItemCell: BaseCollectionCell {
    // MARK: IBOutlets
    @IBOutlet private weak var imageViewIcon: UIImageView!
    @IBOutlet private weak var labelTitle: UILabel! {
        didSet {
            labelTitle.textAlignment = .center
        }
    }
    
    // MARK: - Properties
    var viewModel: TvPopulerItemVM? {
        didSet {
            updateUI()
        }
    }
    
    // MARK: - Override Functions
    override func updateUI() {
        super.updateUI()
        guard let viewModel = viewModel else {
            return
        }
        labelTitle.text = viewModel.name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageViewIcon.image = nil
        labelTitle.text = nil
    }
}
