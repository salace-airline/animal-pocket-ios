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
    NavigationStack {
      Text("Insectes")
        .font(.custom("FinkHeavy", size: 20))
        .font(.subheadline)
      
      HStack {        
        Button(action: {
          viewModel.filter = .alphatically
          viewModel.alphabeticalOrder = true
        }, label: {
          Text("Nom")
        })
        
        Button(action: {
          viewModel.filter = .increasingPrice
          viewModel.increasingPrice = true
        }, label: {
          Text("Prix + -")
      })
        
        Button(action: {
          viewModel.filter = .decreasingPrice
          viewModel.decreasingPrice = true
        }, label: {
          Text("Prix - +")
        })
        
        Button(action: {
          viewModel.filter = .noFilter
        }, label: {
          Image(systemName: "eraser")
        })
      }
      .buttonStyle(.bordered)
      
      switch viewModel.filter {
        case .noFilter:
          loadedBugs(bugs: viewModel.bugsArray)
        case .increasingPrice:
          loadedBugs(bugs: viewModel.sortedIncreasingPrice)
        case .decreasingPrice:
          loadedBugs(bugs: viewModel.sortedDecreasingPrice)
        case .alphatically:
          loadedBugs(bugs: viewModel.sortedAlphabetically)
      }
    }
  }
  
  func loadedBugs(bugs: [Bug]) -> some View {
    NavigationStack {
      ScrollView(.vertical) {
        LazyVGrid(columns: columns) {
          ForEach(bugs) { bug in
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
