//
//  SearchBarView.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/03.
//

import SwiftUI

struct SearchBarView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "popcorn")
                    .foregroundColor(Color("Pale Yellow"))
                Text("Search Your Movie")
                    .foregroundColor(.gray)
                
                Spacer()
                
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .font(.system(size: 20))
            }
            .padding(.bottom, 10)
            .padding(.horizontal)
        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
