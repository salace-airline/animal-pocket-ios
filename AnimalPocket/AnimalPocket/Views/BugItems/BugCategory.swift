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
      
      switch viewModel.filter {
        case .noFilter:
          loadedBugs(with: viewModel.bugsArray)
        case .increasingPrice:
          loadedBugs(with: viewModel.sortedIncreasingPrice)
        case .decreasingPrice:
          loadedBugs(with: viewModel.sortedDecreasingPrice)
        case .alphatically:
          loadedBugs(with: viewModel.sortedAlphabetically)
      }
      
      BugsFilterButtons()
      
//      HStack {
//        SelectButton(isSelected: $viewModel.alphabeticalOrder,
//                     color: .green,
//                     buttonText: "Nom")
//        .onTapGesture(perform: {
//          viewModel.alphabeticalOrder.toggle()
//          viewModel.filter = .alphatically
//
//          if viewModel.alphabeticalOrder {
//            viewModel.increasingPrice = false
//            viewModel.decreasingPrice = false
//            viewModel.noFilter = false
//          }
//        })
//
//        SelectButton(isSelected: $viewModel.decreasingPrice,
//                     color: .green,
//                     buttonText: "Prix + -")
//        .onTapGesture(perform: {
//          viewModel.decreasingPrice.toggle()
//          viewModel.filter = .decreasingPrice
//
//          if viewModel.decreasingPrice {
//            viewModel.alphabeticalOrder = false
//            viewModel.increasingPrice = false
//            viewModel.noFilter = false
//          }
//        })
//
//        SelectButton(isSelected: $viewModel.increasingPrice,
//                     color: .green,
//                     buttonText: "Prix + -")
//        .onTapGesture(perform: {
//          viewModel.increasingPrice.toggle()
//          viewModel.filter = .increasingPrice
//
//          if viewModel.increasingPrice {
//            viewModel.alphabeticalOrder = false
//            viewModel.decreasingPrice = false
//            viewModel.noFilter = false
//          }
//        })
//
//        SelectButton(isSelected: $viewModel.noFilter,
//                     color: .green,
//                     buttonText: "🧽")
//        .onTapGesture(perform: {
//          viewModel.noFilter.toggle()
//          viewModel.filter = .noFilter
//
//          if viewModel.noFilter {
//            viewModel.alphabeticalOrder = false
//            viewModel.increasingPrice = false
//            viewModel.decreasingPrice = false
//          }
//        })
//      }
    }
  }
  
  func loadedBugs(with bugs: [Bug]) -> some View {
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
