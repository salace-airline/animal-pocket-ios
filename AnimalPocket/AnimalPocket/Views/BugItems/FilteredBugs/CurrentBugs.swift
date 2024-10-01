//
//  CurrentBugs.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 27/01/2023.
//

import SwiftUI

struct CurrentBugs: View {
  @EnvironmentObject var user: UserViewModel
  @ObservedObject var viewModel = CollectibleViewModel(category: .bug)
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    VStack {
      if user.showMissingBugs {
        loadedBugs(with: viewModel.filterItems(user.showMissingBugs(viewModel.bugsArray)))
          .onAppear(perform: {
            viewModel.loadItems()
          })
      } else {
        loadedBugs(with: viewModel.filterItems(viewModel.bugsArray))
          .onAppear(perform: {
            viewModel.loadItems()
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
