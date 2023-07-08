//
//  StarView.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/08.
//

import SwiftUI

struct StarView: View {
    let movie_vote_average: Float
    
    var body: some View {
        
        let starNumber: Int = Int(movie_vote_average / 2)
        
        HStack(spacing: 0) {
            ForEach(0..<starNumber, id: \.self) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
            if movie_vote_average / 2 - Float(starNumber) >= 0.5 {
                Image(systemName: "star.leadinghalf.filled")
                    .foregroundColor(.yellow)
            }
            
            let emptyStarNumber = (movie_vote_average / 2 - Float(starNumber) >= 0.5) ? (5 - starNumber - 1) : (5 - starNumber)
            
            ForEach(0..<emptyStarNumber, id: \.self) { index in
                Image(systemName:"star")
                    .foregroundColor(.yellow)
            }
        }
        
    }
}

