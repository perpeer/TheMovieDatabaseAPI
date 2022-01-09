//
//  TvPopularVM.swift
//  TheMovieDatabaseAPI
//
//  Created by Ekrem TAŞKIRAN on 9.01.2022.
//

import Foundation

final class TvPopularVM: BaseVM {
    private var response: TvPopularModel?
    private var results: [TvPopulerItemVM] { response?.results.map { TvPopulerItemVM($0) } ?? [] }
    private var searchTimerPeriod: TimeInterval = 1
    private var searchTimer: Timer?
    var itemCount: Int { results.count }
    
    func fetchPupular() {
        setState(.loading)
        let url = "\(Constants.NS.UrlPrefix)tv/popular?api_key=\(Constants.NS.ApiKey)&page=1"
        ServiceManager.shared.fetchResponse(of: TvPopularModel.self,
                                            from: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.response = response
                self.setState(.success)
            case .failure(let err):
                print("TvPopularVM.fetchResponse.err: \(err)")
                self.setState(.error)
            }
        }
    }
    
    func search(with text: String) {
        guard let searchText = text.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed),
              !searchText.isEmpty,
              let lastCh = text.last,
              !lastCh.isWhitespace,
              searchText.count > 2 else { return }
        
        searchTimer?.invalidate()
        searchTimer = Timer.scheduledTimer(withTimeInterval: searchTimerPeriod, repeats: false) { [weak self] _ in
            guard let self = self else { return }
            self.setState(.loading)
            let url = "\(Constants.NS.UrlPrefix)search/tv?api_key=\(Constants.NS.ApiKey)&query=\(searchText)"
            self.fetchSearch(url: url)
            print("TvPopularVM.search.\(searchText)")
        }
    }
    
    private func fetchSearch(url: String) {
        ServiceManager.shared.fetchResponse(of: TvPopularModel.self,
                                            from: url) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.response = response
                self.setState(.success)
            case .failure(let err):
                print("TvPopularVM.searchTv.err: \(err)")
                self.setState(.error)
            }
        }
    }
    
    func getItem(at index: Int) -> TvPopulerItemVM? {
        guard results.indices.contains(index) else { return nil }
        return results[index]
    }
}

final class TvPopulerItemVM: BaseVM {
    private let movie: TvPopulerItemModel
    private var posterPath: String { movie.posterPath ?? "" }
    var name: String { movie.name ?? "" }
    var voteAverage: Double { movie.voteAverage ?? 0 }
    var overviewText: String { movie.overview ?? ""}
    var language: String { (movie.originalLanguage ?? "").uppercased() }
    var firstAirDate: String { movie.firstAirDate ?? "" }
    var iconUrl: URL? {
        guard !posterPath.isEmpty,
              let url = URL(string: "https://image.tmdb.org/t/p/w400\(posterPath)") else { return nil }
        return url
    }
    
    init(_ item: TvPopulerItemModel) {
        self.movie = item
    }
}
