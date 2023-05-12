//
//  LoginFormView.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 14/04/2023.
//

import SwiftUI

struct LoginFormView: View {
  @State private var userEmail: String = ""
  @State private var userPassword: String = ""
  
  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
      TextField("Email address", text: $userEmail)
        .textContentType(.emailAddress)
        .padding()
        .background(Colors.blueTide.opacity(0.7))
        .cornerRadius(10)
      
      SecureField("Password", text: $userPassword)
        .padding()
        .background(Colors.blueTide.opacity(0.7))
        .cornerRadius(10)
    }
    .padding([.leading, .trailing], 15)
  }
}

struct LoginFormView_Previews: PreviewProvider {
  static var previews: some View {
    LoginFormView()
  }
}
