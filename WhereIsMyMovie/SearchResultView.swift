//
//  SearchResultView.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/22.
//

import SwiftUI

struct SearchResultView: View {
    var results: [Movie]
    var body: some View {
        ScrollView(.vertical) {
            VStack {
                ForEach(results) { result in
                    HStack {
                        AsyncImage(url: result.poster) { image in
                            
                        }
                    }
                }
            }
        }
    }
}

