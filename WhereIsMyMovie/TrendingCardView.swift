//
//  TrendingCardView.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/01.
//

import SwiftUI

extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

struct TrendingCardView: View {
    var movie: Movie
    var counter: Int = 0
    var body: some View {
        ZStack (alignment: .bottomLeading) {
            
            AsyncImage(url: movie.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 240, height: 240 * 0.70588)
            } placeholder: {
                Rectangle().fill(Color(red:61/255,green:61/255,blue:88/255))
                    .frame(width: 240, height: 240 * 0.70588)
            }
            
            let movieTitle = (movie.title.count > 16) ? shorten(movieTitle: movie.title) : movie.title
            
            
            
            
            VStack(alignment: .leading, spacing: 6) {
                StarView(movie_vote_average: movie.vote_average)
                    .padding(.horizontal)
                HStack {
                    Text(movieTitle)
                        .lineLimit(1)
                        .padding(12)
                        .font(.system(size: 16, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                }
                .frame(width: 150)
                .background(Color.black.opacity(0.3))
                .cornerRadius(20, corners: [ .topRight])
            }
            
        }
        .cornerRadius(8)
    }
    func shorten(movieTitle: String) -> String {
        var shortTitle: String = ""
        for i in 0...16 {
            shortTitle = shortTitle + String(movieTitle[i])
        }
        shortTitle = shortTitle + "..."
        return shortTitle
    }
}



struct TrendingCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        TrendingCardView(movie: Movie.preview)
    }
}
