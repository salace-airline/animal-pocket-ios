//
//  BugCategory.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/12/2022.
//

import SwiftUI

struct BugCategory: View {
  @ObservedObject var viewModel = BugsViewModel()
  
  let columns = [
    GridItem(),
    GridItem()
  ]
  
  var body: some View {
    VStack {
      Text("Insectes")
        .font(.custom("FinkHeavy", size: 20))
        .font(.subheadline)
      
      ScrollView(.vertical) {
        LazyVGrid(columns: columns) {
          ForEach(viewModel.bugsArray) { bug in
            BugDetails(bug: bug)
          }
        }
      }
      .onAppear(perform: {
        viewModel.loadBugs()
      })
    }
  }
}

struct BugCategory_Previews: PreviewProvider {
    static var previews: some View {
        BugCategory()
    }
}
