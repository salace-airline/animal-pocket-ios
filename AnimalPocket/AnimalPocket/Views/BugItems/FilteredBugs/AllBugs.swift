//
//  AllBugs.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/12/2022.
//

import SwiftUI

struct AllBugs: View {
  @EnvironmentObject var user: LoginViewModel
  @ObservedObject var viewModel = CollectibleViewModel()
    
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    VStack {
      if viewModel.showMissingItemsOnly {
        switch viewModel.filter {
          case .noFilter:
            loadedBugs(with: user.missingBugs)
          case .increasingPrice:
            loadedBugs(with: viewModel.filter.increasePrice(of: user.missingBugs))
          case .decreasingPrice:
            loadedBugs(with: viewModel.filter.decreasePrice(of: user.missingBugs))
          case .alphatically:
            loadedBugs(with: viewModel.filter.sortAlphabetically(user.missingBugs))
        }
      } else {
        switch viewModel.filter {
          case .noFilter:
            loadedBugs(with: viewModel.bugsArray)
          case .increasingPrice:
            loadedBugs(with: viewModel.filter.increasePrice(of: viewModel.bugsArray))
          case .decreasingPrice:
            loadedBugs(with: viewModel.filter.decreasePrice(of: viewModel.bugsArray))
          case .alphatically:
            loadedBugs(with: viewModel.filter.sortAlphabetically(viewModel.bugsArray))
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

struct AllBugs_Previews: PreviewProvider {
    static var previews: some View {
      AllBugs()
    }
}
