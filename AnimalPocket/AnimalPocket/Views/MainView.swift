//
//  MainView.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 14/04/2023.
//

import SwiftUI

struct MainView: View {
  @EnvironmentObject var user: UserViewModel
//  @State private var selection = 4
  
  var body: some View {
    TabView(selection: $user.selectedTab) {
      HomePage()
        .onTapGesture {
          user.selectedTab = 0
        }
        .tabItem {
          Label("Home", systemImage: "house.circle")
        }
        .tag(0)
        .accessibilityLabel("Home Page Tab Button")
      
      FishCategory()
        .onTapGesture {
          user.selectedTab = 1
        }
        .tabItem {
          Label("Fish", systemImage: "fish")
        }
        .tag(1)
        .accessibilityLabel("Fish Category Tab Button")
      
      BugCategory()
        .onTapGesture {
          user.selectedTab = 2
        }
        .tabItem {
          Label("Bugs", systemImage: "ant")
        }
        .tag(2)
        .accessibilityLabel("Bug Category Tab Button")
      
      SeaCategory()
        .onTapGesture {
          user.selectedTab = 3
        }
        .tabItem {
          Label("Sea", systemImage: "water.waves")
        }
        .tag(3)
        .accessibilityLabel("Sea Creature Category Tab Button")
      
      UserLoginView()
        .onTapGesture {
          user.selectedTab = 4
        }
        .tabItem {
          Label("User", systemImage: "person.circle")
        }
        .tag(4)
        .accessibilityLabel("User connexion Tab Button")
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
