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
        let HighRatingMovie: Bool = (movie_vote_average > 8.0)
        let MediumRatingMovie: Bool = (!HighRatingMovie && movie_vote_average > 5.5)
        let LowRatingMovie: Bool = !MediumRatingMovie
        
        
        HStack(spacing: 0) {
            ForEach(0..<starNumber, id: \.self) { index in
                Image(systemName: "star.fill")
                    .foregroundColor(setStarColor(HighRatingMovie: HighRatingMovie, MediumRatingMovie: MediumRatingMovie, LowRatingMovie: LowRatingMovie))
            }
            if movie_vote_average / 2 - Float(starNumber) >= 0.5 {
                Image(systemName: "star.leadinghalf.filled")
                    .foregroundColor(setStarColor(HighRatingMovie: HighRatingMovie, MediumRatingMovie: MediumRatingMovie, LowRatingMovie: LowRatingMovie))
            }
            
            let emptyStarNumber = (movie_vote_average / 2 - Float(starNumber) >= 0.5) ? (5 - starNumber - 1) : (5 - starNumber)
            
            ForEach(0..<emptyStarNumber, id: \.self) { index in
                Image(systemName:"star")
                    .foregroundColor(setStarColor(HighRatingMovie: HighRatingMovie, MediumRatingMovie: MediumRatingMovie, LowRatingMovie: LowRatingMovie))
            }
        }
        
    }
    func setStarColor(HighRatingMovie: Bool, MediumRatingMovie: Bool, LowRatingMovie: Bool) -> Color {
        if HighRatingMovie {
            return .green
        }
        if MediumRatingMovie {
            return .orange
        }
        if LowRatingMovie {
            return .red
        } else {
            return .yellow
        }
        
    }
}

