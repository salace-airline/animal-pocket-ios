//
//  BugCategory.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 27/01/2023.
//

import SwiftUI

struct BugCategory: View {
  @ObservedObject var viewModel = BugsViewModel()
  @ObservedObject var collectionViewModel: CollectionViewModel
  
  var body: some View {
    VStack {
      Text("Bugs")
        .font(.custom("FinkHeavy", size: 20))
        .font(.subheadline)
      
      ScrollView {
        LazyVStack {
          Toggle(isOn: $viewModel.showCurrentBugs, label: {
            Text("Currently")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if viewModel.showCurrentBugs {
            CurrentBugs(collectionViewModel: collectionViewModel)
          }
        }
        
        LazyVStack {
          Toggle(isOn: $viewModel.showBugsOfTheMonth, label: {
            Text("This Month")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if viewModel.showBugsOfTheMonth {
            BugsOfTheMonth(collectionViewModel: collectionViewModel)
          }
        }
        
        LazyVStack {
          Toggle(isOn: $viewModel.showAllBugs, label: {
            Text("All Bugs")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if viewModel.showAllBugs {
            AllBugs(collectionViewModel: collectionViewModel)
          }
        }
      }
      Image("tide3")
        .resizable()
        .aspectRatio(contentMode: .fit)
    }
    .edgesIgnoringSafeArea(.bottom)
  }
}

struct BugCategory_Previews: PreviewProvider {
  static var previews: some View {
    BugCategory(collectionViewModel: CollectionViewModel())
  }
}
