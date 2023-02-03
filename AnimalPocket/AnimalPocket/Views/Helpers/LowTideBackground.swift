//
//  LowTideBackground.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 27/12/2022.
//

import SwiftUI

struct LowTideBackground: View {
  var body: some View {
    Image("lowTide")
      .resizable()
      .aspectRatio(contentMode: .fill)
      .ignoresSafeArea()
  }
}

struct LowTideBackground_Previews: PreviewProvider {
  static var previews: some View {
    LowTideBackground()
  }
}
