//
//  SeaCategory.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/12/2022.
//

import SwiftUI

struct SeaCategory: View {
  @ObservedObject var viewModel = SeaCreatureViewModel()
  @State private var showCurrentSeaCreatures = true
  @State private var showSeaCreaturesOfTheMonth = true
  @State private var showAllSeaCreatures = true
  
  var body: some View {
    VStack {
      Text("Sea Creatures")
        .font(.custom("FinkHeavy", size: 20))
        .font(.subheadline)
      
      ScrollView {
        LazyVStack {
          Toggle(isOn: $showCurrentSeaCreatures, label: {
            Text("Currently")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if showCurrentSeaCreatures {
            CurrentSeaCreatures()
          }
        }
        
        LazyVStack {
          Toggle(isOn: $showSeaCreaturesOfTheMonth, label: {
            Text("This Month")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if showSeaCreaturesOfTheMonth {
            SeaCreaturesOfTheMonth()
          }
        }
        
        LazyVStack {
          Toggle(isOn: $showAllSeaCreatures, label: {
            Text("All Sea Creatures")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if showAllSeaCreatures {
            AllSeaCreatures()
          }
        }
      }
      Image("tide3")
        .resizable()
        .aspectRatio(contentMode: .fit)
    }
    .edgesIgnoringSafeArea(.bottom)
  }
}


struct SeaCategory_Previews: PreviewProvider {
    static var previews: some View {
        SeaCategory()
    }
}
