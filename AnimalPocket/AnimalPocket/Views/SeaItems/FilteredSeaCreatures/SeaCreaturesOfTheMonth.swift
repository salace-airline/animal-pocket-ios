//
//  SeaCreaturesOfTheMonth.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 03/02/2023.
//

import SwiftUI

struct SeaCreaturesOfTheMonth: View {
  @EnvironmentObject var user: UserViewModel
  @ObservedObject var viewModel = CollectibleViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    VStack {
      if user.showMissingItemsOnly {
        loadedSea(sea: viewModel.filterItems(user.showMissingSeaCreatures(viewModel.seaArray)))
          .onAppear(perform: {
            viewModel.loadSeaCreatures()
          })
      } else {
        loadedSea(sea: viewModel.filterItems(viewModel.seaArray))
          .onAppear(perform: {
            viewModel.loadSeaCreatures()
          })
      }
    }
  }
  
  func loadedSea(sea: [CollectibleItem]) -> some View {
    VStack {
      SeaButtons(viewModel: viewModel)
      
      ScrollView(.vertical) {
        LazyVGrid(columns: columns, spacing: 10) {
          ForEach(sea) { sea in
            SeaDetails(seaCreature: sea)
          }
        }
      }
    }
  }
}

struct SeaCreaturesOfTheMonth_Previews: PreviewProvider {
  static var previews: some View {
    SeaCreaturesOfTheMonth()
  }
}
