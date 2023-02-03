//
//  BugCategory.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 28/12/2022.
//

import SwiftUI

struct AllBugs: View {
  @ObservedObject var viewModel = BugsViewModel()
    
  var items: [GridItem] {
    Array(repeating: .init(.adaptive(minimum: 120)), count: 2)
  }
  
  var body: some View {
    NavigationStack {      
      switch viewModel.filter {
        case .noFilter:
          loadedBugs(with: viewModel.bugsArray)
        case .increasingPrice:
          loadedBugs(with: viewModel.increasePrice(of: viewModel.bugsArray))
        case .decreasingPrice:
          loadedBugs(with: viewModel.decreasePrice(of: viewModel.bugsArray))
        case .alphatically:
          loadedBugs(with: viewModel.sortAlphabetically(viewModel.bugsArray))
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
        LazyVGrid(columns: items, spacing: 10) {
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
