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

        Section(header: Text("Insectes")) {
          GridView()
        }

        Section(header: Text("Créatures Marines")) {
          GridView()
        }
      } .listStyle(.plain)
      .navigationTitle("Pocket App")
      .navigationBarTitleDisplayMode(.inline)
      .font(.custom("FinkHeavy", size: 18))
    }
  }
}

struct HomePage_Previews: PreviewProvider {
  static var previews: some View {
    HomePage()
  }
}
