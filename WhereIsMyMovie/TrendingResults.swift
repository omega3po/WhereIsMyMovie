//
//  TrendingResults.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/01.
//

import Foundation

struct TrendingResults: Decodable {
    var page: Int
    var results: [Movie]
    var total_pages: Int
    var total_results: Int
}

struct Movie: Identifiable, Decodable {
    var adult: Bool
    var id: Int
    var poster_path: String?
    var title: String
    var overview: String
    var vote_average: Float
    var backdrop_path: String?
    
    var backdropURL: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
        return baseURL?.appending(path: backdrop_path ?? "")
    }
    
    var posterThumbnail: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w100")
        return baseURL?.appending(path: poster_path ?? "")
    }
    
    var poster: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w500")
        return baseURL?.appending(path: poster_path ?? "")
    }
    
    static var preview: Movie {
        return Movie(adult: false,
                     id: 23834,
                     poster_path: "https://image.tmdb.org/t/p/w300",
                     title: "Free Guy Was A Bad Guy In The Movie",
                     overview: "some demo text here",
                     vote_average: 9,
                     backdrop_path: "https://image.tmdb.org/t/p/w300")
    }
}
