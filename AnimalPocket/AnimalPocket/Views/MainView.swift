//
//  MainView.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 14/04/2023.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    TabView {
      HomePage()
        .tabItem {
          Label("Home", systemImage: "house.circle")
        }
      
      UserLoginView()
        .tabItem {
          Label("User", systemImage: "person.circle")
        }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
