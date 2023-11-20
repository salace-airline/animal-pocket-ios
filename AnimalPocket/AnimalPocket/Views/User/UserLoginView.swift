//
//  UserLoginView.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 14/04/2023.
//

import SwiftUI

struct UserLoginView: View {
  @EnvironmentObject var collection: CollectionViewModel
  @EnvironmentObject var viewModel: LoginViewModel
  
  var body: some View {
    ZStack {
      Colors.beige200.ignoresSafeArea()
        .opacity(0.2)
      VStack {
        Spacer()
        
        Image("nookbestfriends")
          .resizable()
          .frame(width: 200, height: 200)
          .clipShape(Circle())
          .padding(.bottom, 50)
        
        Text("Hello!")
          .font(.largeTitle).foregroundColor(Colors.blueDark)
          .padding([.top, .bottom], 40)
        
        LoginFormView(viewModel: viewModel)
        
        Spacer()
        
        Button(action: {
          Task {
            if await viewModel.checkExistingUser() {
              if viewModel.isUserLoggedIn == false {
                Task {
                  await viewModel.login()
                  viewModel.isUserLoggedIn = true
                }
              } else {
                // alert to tell the user they're already logged-in
                print("You're already logged-in!")
              }
            } else {
              // alert to tell the user they need to register first
              print("You need to register first!")
            }
          }
        }) {
          Text("Sign In")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Colors.blueDark)
            .cornerRadius(10)
        }
        .padding(15)
        
        HStack(spacing: 0) {
          Text("Don't have an account? ")
          Button(action: {
            Task {
              if await viewModel.checkExistingUser() == false {
                Task {
                  await viewModel.register()
                }
              } else {
                // alert to tell the user they're already registered
                print("You're already registered!")
              }
            }
          }) {
            Text("Sign Up")
              .foregroundColor(Colors.greenLight)
          }
        }
        .padding(.bottom, 15)
        
        Image("tide3")
          .resizable()
          .aspectRatio(contentMode: .fit)
      }
      .edgesIgnoringSafeArea(.bottom)
    }
    .onAppear {
      Task {
        let doesUserExist = await viewModel.checkExistingUser()
        if doesUserExist == false {
          collection.emptyCollection()
        }
      }
    }
  }
}
