//
//  LoginFormView.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 14/04/2023.
//

import SwiftUI

struct LoginFormView: View {
  @ObservedObject var viewModel: LoginViewModel
  
  var body: some View {
    VStack(alignment: .leading, spacing: 15) {
      TextField("Email address", text: $viewModel.userEmail)
        .textContentType(.emailAddress)
        .autocapitalization(.none)
        .disableAutocorrection(true)
        .padding()
        .background(Colors.blueTide.opacity(0.7))
        .cornerRadius(10)
      
      SecureField("Password", text: $viewModel.userPassword)
        .padding()
        .background(Colors.blueTide.opacity(0.7))
        .cornerRadius(10)
    }
    .padding([.leading, .trailing], 15)
  }
}
