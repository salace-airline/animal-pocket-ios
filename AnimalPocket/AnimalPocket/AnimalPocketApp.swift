//
//  AnimalPocketApp.swift
//  AnimalPocket
//
//  Created by Céline Barbe on 28/10/2022.
//

import SwiftUI

@main
struct AnimalPocketApp: App {
  private var viewModel = FishViewModel()
  
  var body: some Scene {
    WindowGroup {
      FishRow(viewModel: viewModel)
    }
  }
}
