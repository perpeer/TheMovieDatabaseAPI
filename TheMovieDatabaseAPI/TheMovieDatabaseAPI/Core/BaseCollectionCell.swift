//
//  BaseCollectionCell.swift
//  TheMovieDatabaseAPI
//
//  Created by Ekrem TAŞKIRAN on 9.01.2022.
//

import UIKit

class BaseCollectionCell: UICollectionViewCell, ReusableView, NibLoadableView {
 
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    // MARK: - Customize your layouts
    func setupUI() {
        
    }
    
    // MARK: - Redraw your specific layouts
    func updateUI() {
        
    }
}
