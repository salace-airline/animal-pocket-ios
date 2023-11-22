//
//  BugsOfTheMonth.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 27/01/2023.
//

import SwiftUI

struct BugsOfTheMonth: View {
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
            loadedBugs(with: viewModel.filterCurrentMonth(for: user.showMissingBugs(viewModel.bugsArray)))
          case .increasingPrice:
            loadedBugs(with: viewModel.filter.increasePrice(of: viewModel.filterCurrentMonth(for: user.showMissingBugs(viewModel.bugsArray))))
          case .decreasingPrice:
            loadedBugs(with: viewModel.filter.decreasePrice(of: viewModel.filterCurrentMonth(for: user.showMissingBugs(viewModel.bugsArray))))
          case .alphatically:
            loadedBugs(with: viewModel.filter.sortAlphabetically(viewModel.filterCurrentMonth(for: user.showMissingBugs(viewModel.bugsArray))))
        }
      } else {
        switch viewModel.filter {
          case .noFilter:
            loadedBugs(with: viewModel.filterCurrentMonth(for: viewModel.bugsArray))
          case .increasingPrice:
            loadedBugs(with: viewModel.filter.increasePrice(of: viewModel.filterCurrentMonth(for: viewModel.bugsArray)))
          case .decreasingPrice:
            loadedBugs(with: viewModel.filter.decreasePrice(of: viewModel.filterCurrentMonth(for: viewModel.bugsArray)))
          case .alphatically:
            loadedBugs(with: viewModel.filter.sortAlphabetically(viewModel.filterCurrentMonth(for: viewModel.bugsArray)))
        }
      }
    }
    .onAppear(perform: {
      viewModel.loadBugs()
    })
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
  }
}

struct BugsOfTheMonth_Previews: PreviewProvider {
  static var previews: some View {
    BugsOfTheMonth(viewModel: CollectibleViewModel()
    )
  }
}
