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
      ZStack {
        LowTideBackground()
        VStack(alignment: .center) {
          Text("En ce moment")
            .font(.custom("FinkHeavy", size: 20))
            .font(.subheadline)
          
          ScrollView {
            HStack {
              VStack {
                NavigationLink("Poissons \(Image(systemName: "chevron.right"))") {
                  FishCategory()
                }
                .buttonStyle(.plain)
                FishRow()
              }
            }
            
            HStack {
              VStack {
                NavigationLink("Insectes \(Image(systemName: "chevron.right"))") {
                  BugCategory()
                }
                .buttonStyle(.plain)
                BugRow()
              }
            }
            
            HStack {
              VStack {
                NavigationLink("Créatures Marines \(Image(systemName: "chevron.right"))") {
                  SeaCategory()
                }
                .buttonStyle(.plain)
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
