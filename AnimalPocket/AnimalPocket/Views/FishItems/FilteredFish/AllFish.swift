//
//  AllFish.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 03/02/2023.
//

import SwiftUI

struct AllFish: View {
  @EnvironmentObject var user: UserViewModel
  @ObservedObject var viewModel = CollectibleViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    VStack {
      if user.showMissingItemsOnly {
        loadedFish(fish: viewModel.filterItems(user.showMissingFish(viewModel.fishArray)))
      } else {
        loadedFish(fish: viewModel.filterItems(viewModel.fishArray))
      }
    }
    .onAppear(perform: {
      viewModel.loadFish()
    })
  }
  
  func loadedFish(fish: [CollectibleItem]) -> some View {
    VStack {
      FishButtons(viewModel: viewModel)
      
      ScrollView(.vertical) {
        LazyVGrid(columns: columns, spacing: 10) {
          ForEach(fish) { fish in
            FishDetails(fish: fish)
          }
        }
      }
    }
  }
}

struct AllFish_Previews: PreviewProvider {
  static var previews: some View {
    AllFish()
  }
}
