//
//  AnimalPocketApp.swift
//  AnimalPocket
//
//  Created by Céline Barbe on 28/10/2022.
//

import SwiftUI

@main
struct AnimalPocketApp: App {
  @StateObject var collection = CollectionViewModel()
  @StateObject var user = LoginViewModel()
  
  var body: some Scene {
    WindowGroup {
      MainView()
        .environmentObject(user)
        .environmentObject(collection)
    }
  }
}
