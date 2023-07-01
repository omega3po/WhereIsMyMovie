//
//  TrendingCardView.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/01.
//

import SwiftUI



struct TrendingCardView: View {
    var movie: Movie
    var counter: Int = 0
    var body: some View {
        ZStack (alignment: .bottomLeading) {
            AsyncImage(url: movie.backdropURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 340, height: 240)
            } placeholder: {
                Rectangle().fill(Color(red:61/255,green:61/255,blue:88/255))
                    .frame(width: 340, height: 240)
            }
            
            HStack {
                VStack {
                    Text(movie.title)
                        .padding()
                        .font(.system(size: 16, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                        .background(Color.black.opacity(0.3))
                        .cornerRadius(20, corners: [ .topRight])
                }
                
                let starNumber: Int = Int(movie.vote_average / 2)
                ForEach(0..<starNumber, id: \.self) { index in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                if movie.vote_average / 2 - Float(starNumber) > 0.5 {
                    Image(systemName: "star.leadinghalf.filled")
                        .foregroundColor(.yellow)
                }
                
                var emptyStarNumber = (movie.vote_average / 2 - Float(starNumber) > 0.5) ? (5 - starNumber - 1) : (5 - starNumber)
                
                ForEach(0..<emptyStarNumber, id: \.self) { index in
                    Image(systemName:"star")
                        .foregroundColor(.yellow)
                }
            }
        }
        .cornerRadius(8)
    }
}



struct TrendingCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        TrendingCardView(movie: Movie.preview)
    }
}
