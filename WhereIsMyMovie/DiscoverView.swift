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
            ScrollView {
                if searchInput.isEmpty {
                    VStack {
                        HStack {
                            Text("Trending")
                                .padding()
                                .font(.system(size: 30, design: .rounded))
                                .bold()
                                
                            Spacer()
                        }
                        ScrollView(.horizontal, showsIndicators: false) {
                            ForEach(viewModel.trending) { trending in
                                
                                NavigationLink {
                                    //Detail View
                                } label: {
                                    TrendingCardView(movie: trending)
                                }
                                
                            }
                        }
                    }
                } else {
                    
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
