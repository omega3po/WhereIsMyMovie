//
//  MovieDetailView.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/08.
//

import SwiftUI

struct MovieDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var credit: DetailViewModel = DetailViewModel()
    var movie: Movie
    let moviePosterHeight: CGFloat = UIScreen.main.bounds.height
    let moviePosterWidth: CGFloat = UIScreen.main.bounds.width
    var body: some View {
        ZStack {
            
            Color("Dark Gray")
                .ignoresSafeArea()
            VStack {
                ZStack (alignment: .bottom) {
                    ScrollView {
                        AsyncImage(url: movie.poster){ image in
                            image.resizable()
                                .frame(width: moviePosterWidth, height: moviePosterWidth * 1.48148148)
                                .cornerRadius(45, corners: [ .topLeft, .topRight])
                                .shadow(radius: 3)
                                .mask(
                                    LinearGradient(gradient: Gradient(colors: [Color.black,Color.black, Color.black.opacity(0.4), Color.black.opacity(0.1),
                                                                               Color.black.opacity(0),]), startPoint: .top, endPoint: .bottom)
                                )
                            
                        } placeholder: {
                            Rectangle()
                                .frame(width: moviePosterWidth, height: moviePosterWidth * 1.48148148)
                                .shadow(radius: 3)
                                .cornerRadius(45, corners: [ .topLeft, .topRight])
                        }
                        VStack (spacing: 6){
                            Text(movie.title)
                                .foregroundColor(.white)
                                .font(.system(size: 28))
                                .bold()
                                .multilineTextAlignment(.center)
                                .padding(.vertical, 50)
                                .padding(.horizontal, 6)
                            
                            HStack {
                                Text("About")
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding(.horizontal)
                                    .font(.system(size: 30))
                                Spacer()
                            }
                            
                            HStack {
                                Text(movie.overview)
                                    .foregroundColor(.white)
                                    .font(.system(size: 20))
                                    .padding()
                                Spacer()
                            }
                            HStack {
                                Text("Casting")
                                    .foregroundColor(.white)
                                    .bold()
                                    .padding(.horizontal)
                                    .font(.system(size: 30))
                                Spacer()
                            }
                            
                            CastProfileView(movie: movie)
                            
                        }
                        .offset(y: -220)
                    }
                    
                }
                Spacer()
            }
            .ignoresSafeArea()
            
            
            
            
        }
        .overlay(alignment: .topLeading) {
            Button {
                dismiss()
            } label: {
                HStack {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                    .fontWeight(.bold)
                    Text("Back")
                }
                .foregroundColor(Color("Pale Yellow"))
                .padding(6)
                .background(.black.opacity(0.5))
                .cornerRadius(12)
                
            }
            .padding(.leading)
        }
        .task {
            await credit.movieCredits(for: movie.id)
            await credit.loadCastProfile()
            
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(movie: Movie.preview)
    }
}
