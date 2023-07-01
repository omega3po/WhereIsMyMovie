//
//  TrendingResults.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/01.
//

import Foundation

struct TrendingResults: Decodable {
    var page: Int
    var result: [Movie]
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
    
    static var preview: Movie {
        return Movie(adult: false,
                     id: 23834,
                     poster_path: "https://image.tmdb.org/t/p/w300",
                     title: "Free Guy",
                     overview: "some demo text here",
                     vote_average: 5.5,
                     backdrop_path: "https://image.tmdb.org/t/p/w300")
    }
}
