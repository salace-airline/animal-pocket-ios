//
//  BugsFilterButtons.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 19/01/2023.
//

import SwiftUI

struct BugsFilterButtons: View {
  @ObservedObject var viewModel = BugsViewModel()
  
  var body: some View {
    HStack {
      SelectButton(isSelected: $viewModel.alphabeticalOrder,
                   color: .green,
                   buttonText: "Nom")
      .onTapGesture(perform: {
        viewModel.alphabeticalOrder.toggle()
        viewModel.filter = .alphatically
        
        if viewModel.alphabeticalOrder {
          viewModel.increasingPrice = false
          viewModel.decreasingPrice = false
          viewModel.noFilter = false
        }
      })
      
      SelectButton(isSelected: $viewModel.decreasingPrice,
                   color: .green,
                   buttonText: "Prix + -")
      .onTapGesture(perform: {
        viewModel.decreasingPrice.toggle()
        viewModel.filter = .decreasingPrice
        
        if viewModel.decreasingPrice {
          viewModel.alphabeticalOrder = false
          viewModel.increasingPrice = false
          viewModel.noFilter = false
        }
      })
      
      SelectButton(isSelected: $viewModel.increasingPrice,
                   color: .green,
                   buttonText: "Prix + -")
      .onTapGesture(perform: {
        viewModel.increasingPrice.toggle()
        viewModel.filter = .increasingPrice
        
        if viewModel.increasingPrice {
          viewModel.alphabeticalOrder = false
          viewModel.decreasingPrice = false
          viewModel.noFilter = false
        }
      })
      
      SelectButton(isSelected: $viewModel.noFilter,
                   color: .green,
                   buttonText: "🧽")
      .onTapGesture(perform: {
        viewModel.noFilter.toggle()
        viewModel.filter = .noFilter
        
        if viewModel.noFilter {
          viewModel.alphabeticalOrder = false
          viewModel.increasingPrice = false
          viewModel.decreasingPrice = false
        }
      })
    }
  }
}

struct FilterButtons_Previews: PreviewProvider {
  static var previews: some View {
    BugsFilterButtons()
  }
}
