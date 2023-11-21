//
//  SeaCreaturesOfTheMonth.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 03/02/2023.
//

import SwiftUI

struct SeaCreaturesOfTheMonth: View {
  @ObservedObject var viewModel = CollectibleViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    VStack {
      switch viewModel.filter {
        case .noFilter:
          loadedSea(sea: viewModel.filterCurrentMonth(for: viewModel.seaArray))
        case .increasingPrice:
          loadedSea(sea: viewModel.filter.increasePrice(of: viewModel.filterCurrentMonth(for: viewModel.seaArray)))
        case .decreasingPrice:
          loadedSea(sea: viewModel.filter.decreasePrice(of: viewModel.filterCurrentMonth(for: viewModel.seaArray)))
        case .alphatically:
          loadedSea(sea: viewModel.filter.sortAlphabetically(viewModel.filterCurrentMonth(for: viewModel.seaArray)))
      }
    }
  }
  
  func loadedSea(sea: [CollectibleItem]) -> some View {
    VStack {
      SeaButtons(viewModel: viewModel)
      
      ScrollView(.vertical) {
        LazyVGrid(columns: columns, spacing: 10) {
          ForEach(sea) { sea in
            SeaDetails(sea: sea)
          }
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadSeaCreatures()
    })
  }
}

struct SeaCreaturesOfTheMonth_Previews: PreviewProvider {
  static var previews: some View {
    SeaCreaturesOfTheMonth()
  }
}
