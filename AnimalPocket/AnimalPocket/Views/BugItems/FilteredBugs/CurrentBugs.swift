//
//  CurrentBugs.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 27/01/2023.
//

import SwiftUI

struct CurrentBugs: View {
  @ObservedObject var viewModel = BugsViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    VStack {
      switch viewModel.filter {
        case .noFilter:
          loadedBugs(with: viewModel.currentlyAvailable)
        case .increasingPrice:
          loadedBugs(with: viewModel.filter.increasePrice(of: viewModel.currentlyAvailable))
        case .decreasingPrice:
          loadedBugs(with: viewModel.filter.decreasePrice(of: viewModel.currentlyAvailable))
        case .alphatically:
          loadedBugs(with: viewModel.filter.sortAlphabetically(viewModel.currentlyAvailable))
      }
    }
  }
  
  func loadedBugs(with bugs: [CollectibleItem]) -> some View {
    VStack {
      BugButtons(viewModel: viewModel)
      
      ScrollView(.vertical) {
        LazyVGrid(columns: columns, spacing: 10) {
          ForEach(bugs) { bug in
            BugDetails(bug: bug)
          }
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadBugs()
    })
  }
}

struct BugsCurrentMoment_Previews: PreviewProvider {
  static var previews: some View {
    CurrentBugs(
      viewModel: BugsViewModel()
    )
  }
}
