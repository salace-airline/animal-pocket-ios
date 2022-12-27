//
//  HomePage.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/10/2022.
//

import SwiftUI

struct HomePage: View {
  var body: some View {
    NavigationView {
      ZStack {
        LowTideBackground()
        VStack(alignment: .center) {
          Text("En ce moment")
            .font(.custom("FinkHeavy", size: 20))
            .font(.subheadline)
          
          ScrollView {
            HStack {
              LazyVStack {
                Text("Fish")
                FishRow()
              }
            }
            
            HStack {
              VStack {
                Text("Bugs")
                BugRow()
              }
            }
            
            HStack {
              VStack {
                Text("Sea Creatures")
                SeaRow()
              }
            }
          }
        }
      }
    }
    .font(.custom("FinkHeavy", size: 15))
  }
}

struct HomePage_Previews: PreviewProvider {
  static var previews: some View {
    HomePage()
  }
}
