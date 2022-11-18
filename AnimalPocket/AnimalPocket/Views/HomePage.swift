//
//  HomePage.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct HomePage: View {
  var body: some View {
    NavigationStack {
      List {
        Section(header: Text("Poissons")) {
          GridView()
        }
        .listRowBackground(Color.red)

        Section(header: Text("Insectes")) {
          GridView()
        }
        .listRowBackground(Color.red)

        Section(header: Text("Créatures Marines")) {
          GridView()
        }
        .listRowBackground(Color.red)
      }
      .navigationTitle("Pocket App")
      .font(.custom("FinkHeavy", size: 18))
    }
  }
}

struct HomePage_Previews: PreviewProvider {
  static var previews: some View {
    HomePage()
  }
}
