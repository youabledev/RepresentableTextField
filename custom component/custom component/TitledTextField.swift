//
//  TitledTextField.swift
//  custom component
//
//  Created by FramiOS on 2023/08/30.
//

import SwiftUI

struct TitledTextField: View {
    let placeholder: String
    @Binding var text: String
    @State private var isFocused = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("타이틀")
                .padding(.bottom, 8)
            
            RepresentableTextField(placeHolderString: placeholder, keyboardType: .numberPad, text: $text, isFocused: $isFocused)
                .onChange(of: text, perform: { newValue in
                    text = newValue.prettyPhoneNumber
                })
                .frame(height: 50)
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: 3)
                .foregroundColor(.gray)
                .overlay(alignment: .leading, content: {
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(maxWidth: isFocused ? .infinity : 0)
                        .animation(.linear(duration: 0.2), value: isFocused)
                })
        }
    }
}

struct TitledTextField_Previews: PreviewProvider {
    static var previews: some View {
        TitledTextField(placeholder: "이름을 입력해 주세요.", text: .constant(""))
            .previewLayout(.sizeThatFits)
            .padding(10)
    }
}
