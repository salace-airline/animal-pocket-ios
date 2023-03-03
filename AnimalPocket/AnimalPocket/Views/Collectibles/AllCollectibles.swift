//
//  AllCollectibles.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 01/03/2023.
//

import SwiftUI

struct AllCollectibles: View {
  @ObservedObject var viewModel = CollectibleViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    NavigationStack {
      switch viewModel.filter {
        case .noFilter:
          loadedItems(with: viewModel.itemsArray)
        case .increasingPrice:
          loadedItems(with: viewModel.filter.increasePrice(of: viewModel.itemsArray))
        case .decreasingPrice:
          loadedItems(with: viewModel.filter.decreasePrice(of: viewModel.itemsArray))
        case .alphatically:
          loadedItems(with: viewModel.filter.sortAlphabetically(viewModel.itemsArray))
      }
    }
  }
  
  func loadedItems(with items: [CollectibleItem]) -> some View {
    NavigationStack {
//      BugButtons(viewModel: viewModel)
      
      ScrollView(.vertical) {
        LazyVGrid(columns: columns, spacing: 10) {
          ForEach(items) { item in
            CollectibleDetails(viewModel: viewModel, item: item)
          }
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadItems()
    })
  }
}

struct AllCollectibles_Previews: PreviewProvider {
  static var previews: some View {
    AllCollectibles()
  }
}
