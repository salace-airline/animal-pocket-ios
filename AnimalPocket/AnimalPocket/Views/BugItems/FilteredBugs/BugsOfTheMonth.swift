//
//  BugsOfTheMonth.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 27/01/2023.
//

import SwiftUI

struct BugsOfTheMonth: View {
  @EnvironmentObject var user: LoginViewModel
  @ObservedObject var viewModel = BugsViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    VStack {
      switch viewModel.filter {
        case .noFilter:
          loadedBugs(with: viewModel.currentMonth)
        case .increasingPrice:
          loadedBugs(with: viewModel.filter.increasePrice(of: viewModel.currentMonth))
        case .decreasingPrice:
          loadedBugs(with: viewModel.filter.decreasePrice(of: viewModel.currentMonth))
        case .alphatically:
          loadedBugs(with: viewModel.filter.sortAlphabetically(viewModel.currentMonth))
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

struct BugsOfTheMonth_Previews: PreviewProvider {
  static var previews: some View {
    BugsOfTheMonth(viewModel: BugsViewModel()
    )
  }
}
