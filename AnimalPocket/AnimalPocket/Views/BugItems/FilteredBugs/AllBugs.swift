//
//  AllBugs.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/12/2022.
//

import SwiftUI

struct AllBugs: View {
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

struct AllBugs_Previews: PreviewProvider {
    static var previews: some View {
      AllBugs()
    }
}
