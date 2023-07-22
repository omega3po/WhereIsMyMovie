//
//  SearchView.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/03.
//

import SwiftUI

struct SearchView: View {
    
    var body: some View {
        ZStack {
            VStack {
                SearchBarInputView()
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
