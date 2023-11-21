//
//  CurrentBugs.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 27/01/2023.
//

import SwiftUI

struct CurrentBugs: View {
  @EnvironmentObject var user: LoginViewModel
  @ObservedObject var viewModel = CollectibleViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    VStack {
      if user.showMissingItemsOnly {
        switch viewModel.filter {
          case .noFilter:
            loadedBugs(with: viewModel.filterCurrentItems(for: user.showMissingBugs(viewModel.bugsArray)))
          case .increasingPrice:
            loadedBugs(with: viewModel.filter.increasePrice(of: viewModel.filterCurrentItems(for: user.showMissingBugs(viewModel.bugsArray))))
          case .decreasingPrice:
            loadedBugs(with: viewModel.filter.decreasePrice(of: viewModel.filterCurrentItems(for: user.showMissingBugs(viewModel.bugsArray))))
          case .alphatically:
            loadedBugs(with: viewModel.filter.sortAlphabetically(viewModel.filterCurrentItems(for: user.showMissingBugs(viewModel.bugsArray))))
        }
      } else {
        switch viewModel.filter {
          case .noFilter:
            loadedBugs(with: viewModel.filterCurrentItems(for: viewModel.bugsArray))
          case .increasingPrice:
            loadedBugs(with: viewModel.filter.increasePrice(of: viewModel.filterCurrentItems(for: viewModel.bugsArray)))
          case .decreasingPrice:
            loadedBugs(with: viewModel.filter.decreasePrice(of: viewModel.filterCurrentItems(for: viewModel.bugsArray)))
          case .alphatically:
            loadedBugs(with: viewModel.filter.sortAlphabetically(viewModel.filterCurrentItems(for: viewModel.bugsArray)))
        }
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
      viewModel: CollectibleViewModel()
    )
  }
}
