//
//  ContentView.swift
//  custom component
//
//  Created by FramiOS on 2023/08/30.
//

import SwiftUI

struct ContentView: View {
    @State private var phoneNumber: String = ""
    
    var body: some View {
        VStack {
            TitledTextField(placeholder: "010-0000-0000", text: $phoneNumber)
            Spacer()
            Button {
                print("확인 눌림")
            } label: {
                Text("확인")
                    .frame(maxWidth: .infinity, minHeight: 44)
            }
            .disabled(!phoneNumber.isPhoneNumber)
            .buttonStyle(.borderedProminent)
            
        }
        .padding()
        .onTapGesture {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
