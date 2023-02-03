//
//  BugButtons.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 03/02/2023.
//

import SwiftUI

struct BugButtons: View {
  @ObservedObject var viewModel: BugsViewModel
  
  var body: some View {
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
  }
}
