//
//  MainView.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 14/04/2023.
//

import SwiftUI

struct MainView: View {
  @StateObject var collection = CollectionViewModel()
  @State private var selection = 4
  
  var body: some View {
    TabView(selection: $selection) {
      HomePage(collectionViewModel: collection)
        .onTapGesture {
          selection = 0
        }
        .tabItem {
          Label("Home", systemImage: "house.circle")
        }
        .tag(0)
        .accessibilityLabel("Home Page Tab Button")
      
      FishCategory(collectionViewModel: collection)
        .onTapGesture {
          selection = 1
        }
        .tabItem {
          Label("Fish", systemImage: "fish")
        }
        .tag(1)
        .accessibilityLabel("Fish Category Tab Button")
      
      BugCategory(collectionViewModel: collection)
        .onTapGesture {
          selection = 2
        }
        .tabItem {
          Label("Bugs", systemImage: "ant")
        }
        .tag(2)
        .accessibilityLabel("Bug Category Tab Button")
      
      SeaCategory(collectionViewModel: collection)
        .onTapGesture {
          selection = 3
        }
        .tabItem {
          Label("Sea", systemImage: "water.waves")
        }
        .tag(3)
        .accessibilityLabel("Sea Creature Category Tab Button")
      
      UserLoginView()
        .onTapGesture {
          selection = 4
        }
        .tabItem {
          Label("User", systemImage: "person.circle")
        }
        .tag(4)
        .accessibilityLabel("User connexion Tab Button")
    }
    .environmentObject(collection)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
