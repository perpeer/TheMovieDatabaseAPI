//
//  TvPopularModel.swift
//  TheMovieDatabaseAPI
//
//  Created by Ekrem TAŞKIRAN on 9.01.2022.
//

import Foundation

struct TvPopularModel: Decodable {
    let page: Int?
    let results: [TvPopulerItemModel]
}

struct TvPopulerItemModel: Decodable {
    let name: String?
    let posterPath: String?
    let voteAverage: Double?
    let originalLanguage: String?
    let overview: String?
    let firstAirDate: String?
}
