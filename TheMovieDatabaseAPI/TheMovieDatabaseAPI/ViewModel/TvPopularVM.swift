//
//  TvPopularVM.swift
//  TheMovieDatabaseAPI
//
//  Created by Ekrem TAŞKIRAN on 9.01.2022.
//

final class TvPopularVM: BaseVM {
    private var response: TvPopularModel?
    
    func fetchResponse() {
        setState(.loading)
        let url = "https://api.themoviedb.org/3/tv/popular?api_key=fa1a04fcea20f70930511913b74bbf7e&language=en-US&page=1"
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
}
