//
//  AnimalPocketApp.swift
//  AnimalPocket
//
//  Created by Céline Barbe on 28/10/2022.
//

import SwiftUI

@main
struct AnimalPocketApp: App {
  private var viewModel = BugsViewModel()
  
  var body: some Scene {
    WindowGroup {
      BugRow(viewModel: viewModel)
    }
  }
}
