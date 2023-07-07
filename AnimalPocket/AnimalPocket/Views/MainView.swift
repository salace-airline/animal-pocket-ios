//
//  MainView.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 14/04/2023.
//

import SwiftUI

struct MainView: View {
  @State private var selection = 4
  
  var body: some View {
    TabView(selection: $selection) {
      HomePage()
        .onTapGesture {
          selection = 0
        }
        .tabItem {
          Label("Home", systemImage: "house.circle")
        }
        .tag(0)
      
      FishCategory()
        .onTapGesture {
          selection = 1
        }
        .tabItem {
          Label("Fish", systemImage: "fish")
        }
        .tag(1)
      
      BugCategory()
        .onTapGesture {
          selection = 2
        }
        .tabItem {
          Label("Bugs", systemImage: "ant")
        }
        .tag(2)
      
      SeaCategory()
        .onTapGesture {
          selection = 3
        }
        .tabItem {
          Label("Sea", systemImage: "water.waves")
        }
        .tag(3)
      
      UserLoginView()
        .onTapGesture {
          selection = 4
        }
        .tabItem {
          Label("User", systemImage: "person.circle")
        }
        .tag(4)
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
