//
//  SearchBarInputView.swift
//  WhereIsMyMovie
//
//  Created by Sunny Hwang on 2023/07/03.
//

import SwiftUI

struct SearchBarInputView: View {
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @FocusState var keyboardFocused: Bool
    @State var userInput: String = ""
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundColor(.white)
                }
                
                
                SuperTextField(
                    placeholder: Text("Search Your Movie").foregroundColor(.gray),
                    text: $userInput)
                .focused($keyboardFocused)
                .foregroundColor(.white)
                .autocorrectionDisabled(true)
                
                
                Spacer()
                
            }
            .padding(.bottom, 10)
            .padding(.horizontal)
            Rectangle()
                .foregroundColor(Color("Pale Yellow"))
                .frame(width: UIScreen.main.bounds.width, height: 1)
        }
        .background(Color("Royal Blue"))
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                keyboardFocused = true
            }
        }
    }
}

struct SearchBarInputView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarInputView()
    }
}
