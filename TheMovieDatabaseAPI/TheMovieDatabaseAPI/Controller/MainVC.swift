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
            collectionView.register(PopularItemCell.self)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.contentInset = .init(top: 8, left: 8, bottom: 8, right: 8)
            collectionView.showsVerticalScrollIndicator = false
        }
    }
    
    // MARK: - UI Properties
    private lazy var searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.searchBar.delegate = self
        controller.searchResultsUpdater = self
        controller.obscuresBackgroundDuringPresentation = false
        controller.searchBar.placeholder = "Search movies..."
        return controller
    }()
    
    // MARK: - Properties
    private let viewModel = TvPopularVM()
    private var disposal = Disposal()
    
    // MARK: - Override Fuctions
    override func setupUI() {
        super.setupUI()
        title = "Popular Movies"
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.removeViewController(SplashVC.self)
        navigationItem.setHidesBackButton(true, animated: true)
        bindUI()
        viewModel.fetchPupular()
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

extension MainVC: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        viewModel.search(with: text)
    }
}

extension MainVC: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.fetchPupular()
        let topInset = collectionView.contentInset.top + view.safeAreaInsets.top
        collectionView.setContentOffset(CGPoint(x: -collectionView.contentInset.left,
                                                y: -topInset), animated: true)
    }
}

extension MainVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.itemCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PopularItemCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.viewModel = viewModel.getItem(at: indexPath.item)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModel = viewModel.getItem(at: indexPath.item) else { return }
        Coordinator.shared.push(controller: .movieDetailVC, data: viewModel)
    }
}

extension MainVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 24) / 2
        let height = width * 1.43
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        8
    }
}
