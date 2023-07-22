//
//  SearchBarView.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/03.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var Input: String
    @FocusState var keyboardFocused: Bool
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "popcorn")
                    .foregroundColor(Color("Pale Yellow"))
                SuperTextField(
                    placeholder: Text("Search Your Movie").foregroundColor(.white.opacity(0.7)),
                    text: $Input)
                .focused($keyboardFocused)
                .foregroundColor(.white)
                .autocorrectionDisabled(true)
                
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

