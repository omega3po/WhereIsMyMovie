//
//  DiscoverView.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/01.
//

import SwiftUI

struct DiscoverView: View {
    @State var searchInput: String = ""
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
                            
                        }
                    }
                } else {
                    
                }
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
