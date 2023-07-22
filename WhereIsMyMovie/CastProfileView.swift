//
//  CastProfileView.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/17.
//

import SwiftUI

struct CastProfileView: View {
    var movie: Movie
    @StateObject var credit: DetailViewModel = DetailViewModel()
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach (credit.castProfile) { cast in
                    VStack {
                        
                        AsyncImage(url: cast.photoUrl) { image in
                            image.resizable()
                                .scaledToFill()
                                .frame(width: 120, height: 120 * 1.472222)
                                .cornerRadius(10)
                        } placeholder: {
                            Rectangle()
                                .frame(width: 120, height: 120 * 1.472222)
                        }
                        
                        Text("\(cast.name)")
                            .foregroundColor(.white)
                            .frame(width: 120)
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                    }
                }
            }
            .padding()
            .task {
                await credit.movieCredits(for: movie.id)
                await credit.loadCastProfile()
        }
        }
    }
}

struct CastProfileView_Previews: PreviewProvider {
    static var previews: some View {
        CastProfileView(movie: Movie.preview)
    }
}
