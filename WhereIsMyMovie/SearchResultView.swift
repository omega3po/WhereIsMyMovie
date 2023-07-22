//
//  SearchResultView.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/22.
//

import SwiftUI

struct SearchResultView: View {
    var results: [Movie]
    var posterHeight: CGFloat = 180
    var posterWidth: CGFloat = 180 * (27/40)
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                ForEach(results) { result in
                    NavigationLink {
                        MovieDetailView(movie: result)
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        
                        VStack {
                            HStack() {
                                AsyncImage(url: result.poster) { image in
                                    image
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: posterWidth, height: posterHeight)
                                } placeholder: {
                                    ZStack {
                                        Rectangle().fill(Color.gray)
                                            .frame(width: posterWidth, height: posterHeight)
                                        Image(systemName: "questionmark.square.fill")
                                            .foregroundColor(.white)
                                            .font(.system(size: 40))
                                    }
                                    
                                }
                                
                                Text(result.title)
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                                    
                                
                                Spacer()
                            }
                            .padding(.horizontal, 10)
                        }
                        
                    }
                    
                    
                    HStack {
                        Spacer()
                        Rectangle()
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 1)
                            .foregroundColor(.gray)
                            .opacity(0.3)
                            
                        Spacer()
                    }
                    
                }
            }
        }
        .padding(.vertical, 20)
    }
}

