//
//  LoginViewModel.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 01/11/2023.
//

import Foundation

class LoginViewModel: ObservableObject {
  @Published var userEmail: String = ""
  @Published var userPassword: String = ""
  
  @MainActor
  func register() async {
    Task {
      do {
        let registration = try await UserService.registerUser(
          with: UserInfo(
            email: userEmail,
            password: userPassword
          ),
          path: "/register"
        )
        print("User registered successfully! \(registration)")
      } catch {
        print("Error", error)
      }
    }
  }
  
  @MainActor
  func login() async {
    Task {
      do {
        let login = try await UserService.loginUser(
          with: UserInfo(
            email: userEmail,
            password: userPassword
          ),
          path: "/login"
        )
        print("User logged in successfully! \(login)")
      } catch {
        print("Error", error)
      }
    }
  }
}
