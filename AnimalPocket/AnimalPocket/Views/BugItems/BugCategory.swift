//
//  BugCategory.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 27/01/2023.
//

import SwiftUI

struct BugCategory: View {
  @EnvironmentObject var user: LoginViewModel
  @ObservedObject var viewModel = BugsViewModel()
  
  var body: some View {
    VStack {
      HStack {
        Text("Bugs")
          .font(.custom("FinkHeavy", size: 20))
          .font(.subheadline)
        
        Button {
          viewModel.showMissingItemsOnly.toggle()
        } label: {
          Label("Toggle missing bugs", systemImage: viewModel.showMissingItemsOnly ? "eye.slash.fill" : "eye.slash")
            .labelStyle(.iconOnly)
            .foregroundColor(.red)
        }
      }
      
      ScrollView {
        LazyVStack {
          Toggle(isOn: $viewModel.showCurrentBugs, label: {
            Text("Currently")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if viewModel.showCurrentBugs {
            CurrentBugs()
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
            BugsOfTheMonth()
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
            AllBugs()
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
    BugCategory()
  }
}
