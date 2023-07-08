//
//  DiscoverView.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/01.
//

import SwiftUI

struct DiscoverView: View {
    
    @State var searchInput: String = ""
    @StateObject var viewModel = ViewModel()
    var body: some View {
        NavigationStack {
            ZStack {
                Color("Royal Blue")
                    .edgesIgnoringSafeArea(.all)
                    
                VStack (spacing: 0){
                    NavigationLink {
                        SearchView()
                            .navigationBarBackButtonHidden(true)   
                    } label: {
                        SearchBarView()
                    }
                        
                    
                    //A line
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color("Pale Yellow"))
                        .padding(0)
                    //A line End
                    
                    ScrollView {
                        if searchInput.isEmpty {
                            VStack {
                                HStack {
                                    Text("Trending")
                                        .foregroundColor(.white)
                                        .padding()
                                        .font(.system(size: 30, design: .rounded))
                                        .bold()
                                    
                                    Spacer()
                                }
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 14) {
                                        ForEach(viewModel.trending) { trending in
                                            
                                            NavigationLink {
                                                MovieDetailView(movie: trending)
                                            } label: {
                                                TrendingCardView(movie: trending)
                                        
                                                    
                                            }
                                            
                                        }
                                    }
                                }
                            }
                        } else {
                            
                        }
                    }
                }
            }
        }
        .onAppear(perform: viewModel.loadTrending)
    }
}


struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
