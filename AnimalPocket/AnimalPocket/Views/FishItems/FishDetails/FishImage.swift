//
//  FishImage.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 09/12/2022.
//

import Foundation
import SwiftUI

struct FishImage: View {
  var fish: Collectible
  
  var body: some View {
    AsyncImage(url: URL(string: fish.iconURI)) { image in
      image
        .resizable()
        .scaledToFit()
        .background(Image("fond_bleu"))
        .frame(maxWidth: .infinity)
        .clipShape(Rectangle())
    } placeholder: {
        ProgressView()
    }
    .aspectRatio(2, contentMode: .fit)
  }
}

struct FishImage_Previews: PreviewProvider {
  static var previews: some View {
    FishImage(fish: Collectible.sample)
  }
}
