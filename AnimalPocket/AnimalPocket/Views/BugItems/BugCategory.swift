//
//  BugCategory.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 27/01/2023.
//

import SwiftUI

struct BugCategory: View {
  @ObservedObject var viewModel = BugsViewModel()
  @State private var showCurrentBugs = true
  @State private var showBugsOfTheMonth = true
  @State private var showAllBugs = true
  
  var body: some View {
    NavigationStack {
      Text("Insectes")
        .font(.custom("FinkHeavy", size: 20))
        .font(.subheadline)
      
      ScrollView {
        LazyVStack {
          Toggle(isOn: $showCurrentBugs, label: {
            Text("En ce moment")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if showCurrentBugs {
            CurrentBugs()
          }
        }
        
        LazyVStack {
          Toggle(isOn: $showBugsOfTheMonth, label: {
            Text("Ce mois-ci")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if showBugsOfTheMonth {
            BugsOfTheMonth()
          }
        }
        
        LazyVStack {
          Toggle(isOn: $showAllBugs, label: {
            Text("Tous les Insectes")
              .font(.custom("FinkHeavy", size: 20))
              .font(.subheadline)
          })
          .toggleStyle(MinusToggleStyle())
          
          if showAllBugs {
            AllBugs()
          }
        }
      }
    }
  }
}

struct BugCategory_Previews: PreviewProvider {
  static var previews: some View {
    BugCategory()
  }
}
