//
//  BugsOfTheMonth.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 27/01/2023.
//

import SwiftUI

struct BugsOfTheMonth: View {
  @ObservedObject var viewModel = BugsViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    NavigationStack {
      switch viewModel.filter {
        case .noFilter:
          loadedBugs(with: viewModel.currentMonthBugs)
        case .increasingPrice:
          loadedBugs(with: viewModel.increasePrice(of: viewModel.currentMonthBugs))
        case .decreasingPrice:
          loadedBugs(with: viewModel.decreasePrice(of: viewModel.currentMonthBugs))
        case .alphatically:
          loadedBugs(with: viewModel.sortAlphabetically(viewModel.currentMonthBugs))
      }
    }
  }
  
  func loadedBugs(with bugs: [Bug]) -> some View {
    NavigationStack {
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
    BugsOfTheMonth()
  }
}
