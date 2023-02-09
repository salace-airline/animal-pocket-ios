//
//  CurrentFish.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 03/02/2023.
//

import SwiftUI

struct CurrentFish: View {
  @ObservedObject var viewModel = FishViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    NavigationStack {
      switch viewModel.filter {
        case .noFilter:
          loadedFish(fish: viewModel.currentlyAvailable)
        case .increasingPrice:
          loadedFish(fish: viewModel.filter.increasePrice(of: viewModel.currentlyAvailable))
        case .decreasingPrice:
          loadedFish(fish: viewModel.filter.decreasePrice(of: viewModel.currentlyAvailable))
        case .alphatically:
          loadedFish(fish: viewModel.filter.sortAlphabetically(viewModel.currentlyAvailable))
      }
    }
  }
  
  func loadedFish(fish: [Collectible]) -> some View {
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

struct CurrentFish_Previews: PreviewProvider {
  static var previews: some View {
    CurrentFish()
  }
}
