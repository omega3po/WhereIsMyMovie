//
//  CastProfile.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/15.
//

import Foundation

struct CastProfile: Identifiable, Decodable {
    let id: Int
    let birthDay: String?
    let name: String
    let profile_path: String?
    var photoUrl: URL? {
        let baseURL = URL(string: "https://image.tmdb.org/t/p/w200")
        return baseURL?.appending(path: profile_path ?? "")
    }
}
