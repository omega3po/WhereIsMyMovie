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
                Color("Dark Gray")
                    .edgesIgnoringSafeArea(.all)
                
                VStack (spacing: 0){
                    SearchBarView(Input: $searchInput)
                    
                    
                    //A line
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(Color("Pale Yellow"))
                        .padding(0)
                    //A line End
                    
                    ScrollView {
                        if searchInput.isEmpty {
                            VStack (spacing: 0) {
                                HStack {
                                    Text("Trending")
                                        .foregroundColor(.white)
                                        .padding()
                                        .font(.system(size: 30))
                                    
                                    
                                    Spacer()
                                }
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 0) {
                                        ForEach(viewModel.trending) { trending in
                                            
                                            NavigationLink {
                                                MovieDetailView(movie: trending).navigationBarBackButtonHidden(true)
                                            } label: {
                                                TrendingCardView(movie: trending)
                                                
                                                
                                            }
                                            
                                        }
                                    }
                                }
                                
                            }
                        } else {
                            SearchResultView(results: viewModel.searchResults)
                        }
                    }
                }
            }
        }
        .onChange(of: searchInput, perform: { value in
            viewModel.loadSearch(input: value)
        })
        .onAppear(perform: viewModel.loadTrending)
    }
}


struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
