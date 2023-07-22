//
//  CreditModel.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/15.
//

import Foundation

struct CreditModel: Identifiable, Decodable {
    let id: Int
    let cast: [Cast]
    
    struct Cast: Identifiable, Decodable {
        let name: String
        let id: Int
        let character: String
        let order: Int
    }
}
