//
//  BugsOfTheMonth.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 27/01/2023.
//

import SwiftUI

struct BugsOfTheMonth: View {
  @EnvironmentObject var user: UserViewModel
  @ObservedObject var viewModel = CollectibleViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    VStack {
      if user.showMissingBugs {
        loadedBugs(with: viewModel.filterItems(user.showMissingBugs(viewModel.bugsArray)))
          .onAppear(perform: {
            viewModel.loadBugs()
          })
      } else {
        loadedBugs(with: viewModel.filterItems(viewModel.bugsArray))
          .onAppear(perform: {
            viewModel.loadBugs()
          })
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
  }
}

struct BugsOfTheMonth_Previews: PreviewProvider {
  static var previews: some View {
    BugsOfTheMonth(viewModel: CollectibleViewModel()
    )
  }
}
