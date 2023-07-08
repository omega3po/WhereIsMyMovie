//
//  MovieDetailView.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/08.
//

import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    var body: some View {
        ZStack {
            Color("Dark Blue")
                .ignoresSafeArea(.all)
            VStack (spacing: 0){
                ZStack {
                    AsyncImage(url: movie.backdropURL) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(height: 300)
                    } placeholder: {
                        Rectangle()
                            .frame(height: 300)
                    }
                    
                    HStack {
                        Text(movie.title)
                            .foregroundColor(.white)
                            .font(.system(size: 32, design: .rounded))
                            .fontWeight(.heavy)
                            .padding()
                            .background(.ultraThinMaterial)
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                }
                
            }
            
            VStack {
                
                Text(movie.overview)
            }
            Spacer()
            
        }
        .ignoresSafeArea(.all)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.preview)
    }
}
