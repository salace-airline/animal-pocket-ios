//
//  AllFish.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 03/02/2023.
//

import SwiftUI

struct AllFish: View {
  @ObservedObject var viewModel = FishViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    NavigationStack {
      switch viewModel.filter {
        case .noFilter:
          loadedFish(fish: viewModel.fishArray)
        case .increasingPrice:
          loadedFish(fish: viewModel.filter.increasePrice(of: viewModel.fishArray))
        case .decreasingPrice:
          loadedFish(fish: viewModel.filter.decreasePrice(of: viewModel.fishArray))
        case .alphatically:
          loadedFish(fish: viewModel.filter.sortAlphabetically(viewModel.fishArray))
      }
    }
  }
  
  func loadedFish(fish: [CollectibleItem]) -> some View {
    NavigationStack {
      FishButtons(viewModel: viewModel)
      
      ScrollView(.vertical) {
        LazyVGrid(columns: columns, spacing: 10) {
          ForEach(fish) { fish in
            FishDetails(fish: fish)
          }
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadFish()
    })
  }
}

struct AllFish_Previews: PreviewProvider {
  static var previews: some View {
    AllFish()
  }
}
