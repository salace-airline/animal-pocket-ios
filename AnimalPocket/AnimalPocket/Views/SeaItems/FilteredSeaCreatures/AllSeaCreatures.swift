//
//  AllSeaCreatures.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 03/02/2023.
//

import SwiftUI

struct AllSeaCreatures: View {
  @ObservedObject var viewModel = SeaCreatureViewModel()
  @ObservedObject var collectionViewModel: CollectionViewModel
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    VStack {
      switch viewModel.filter {
        case .noFilter:
          loadedSea(sea: viewModel.seaArray)
        case .increasingPrice:
          loadedSea(sea: viewModel.filter.increasePrice(of: viewModel.seaArray))
        case .decreasingPrice:
          loadedSea(sea: viewModel.filter.decreasePrice(of: viewModel.seaArray))
        case .alphatically:
          loadedSea(sea: viewModel.filter.sortAlphabetically(viewModel.seaArray))
      }
    }
  }
  
  func loadedSea(sea: [CollectibleItem]) -> some View {
    VStack {
      SeaButtons(viewModel: viewModel)
      
      ScrollView(.vertical) {
        LazyVGrid(columns: columns, spacing: 10) {
          ForEach(sea) { sea in
            SeaDetails(viewModel: collectionViewModel, sea: sea)
          }
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadSeaCreature()
    })
  }
}

struct AllSeaCreatures_Previews: PreviewProvider {
  static var previews: some View {
    AllSeaCreatures(collectionViewModel: CollectionViewModel())
  }
}
