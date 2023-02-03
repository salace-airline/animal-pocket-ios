//
//  CurrentBugs.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 27/01/2023.
//

import SwiftUI

struct CurrentBugs: View {
  @ObservedObject var viewModel = BugsViewModel()
  
  let columns = [
    GridItem(.adaptive(minimum: 160))
  ]
  
  var body: some View {
    NavigationStack {
      switch viewModel.filter {
        case .noFilter:
          loadedBugs(with: viewModel.currentlyAvailable)
        case .increasingPrice:
          loadedBugs(with: viewModel.increasePrice(of: viewModel.currentlyAvailable))
        case .decreasingPrice:
          loadedBugs(with: viewModel.decreasePrice(of: viewModel.currentlyAvailable))
        case .alphatically:
          loadedBugs(with: viewModel.sortAlphabetically(viewModel.currentlyAvailable))
      }
    }
  }
  
  func loadedBugs(with bugs: [Bug]) -> some View {
    NavigationStack {
      HStack {
        BugFilterButtons(isSelected: $viewModel.alphabeticalOrder,
                         color: Colors.green100,
                         buttonText: "Nom")
        .onTapGesture(perform: {
          viewModel.alphabeticalOrder.toggle()
          viewModel.filter = .alphatically
          viewModel.alphabeticalOrder = true
          
          if viewModel.alphabeticalOrder {
            viewModel.increasingPrice = false
            viewModel.decreasingPrice = false
            viewModel.noFilter = false
          }
        })
        
        BugFilterButtons(isSelected: $viewModel.decreasingPrice,
                         color: Colors.green100,
                         buttonText: "Prix + -")
        .onTapGesture(perform: {
          viewModel.decreasingPrice.toggle()
          viewModel.filter = .decreasingPrice
          viewModel.decreasingPrice = true
          
          if viewModel.decreasingPrice {
            viewModel.alphabeticalOrder = false
            viewModel.increasingPrice = false
            viewModel.noFilter = false
          }
        })
        
        BugFilterButtons(isSelected: $viewModel.increasingPrice,
                         color: Colors.green100,
                         buttonText: "Prix - +")
        .onTapGesture(perform: {
          viewModel.increasingPrice.toggle()
          viewModel.filter = .increasingPrice
          viewModel.increasingPrice = true
          
          if viewModel.increasingPrice {
            viewModel.alphabeticalOrder = false
            viewModel.decreasingPrice = false
            viewModel.noFilter = false
          }
        })
        
        BugFilterButtons(isSelected: $viewModel.noFilter,
                         color: Colors.green100,
                         buttonText: "🧽")
        .onTapGesture(perform: {
          viewModel.noFilter.toggle()
          viewModel.filter = .noFilter
          viewModel.noFilter = true
          
          if viewModel.noFilter {
            viewModel.alphabeticalOrder = false
            viewModel.increasingPrice = false
            viewModel.decreasingPrice = false
          }
        })
      }
      
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
    CurrentBugs()
  }
}
