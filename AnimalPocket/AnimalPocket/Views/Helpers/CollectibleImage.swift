//
//  CollectibleImage.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 08/02/2023.
//

import SwiftUI

struct CollectibleImage: View {
  var item: CollectibleItem
  var background: String
  
  var body: some View {
    AsyncImage(url: URL(string: item.iconURI)) { image in
      image
        .resizable()
        .scaledToFit()
        .background(Image(background))
        .frame(maxWidth: .infinity)
        .clipShape(Rectangle())
    } placeholder: {
      ProgressView()
    }
    .aspectRatio(2, contentMode: .fit)
  }
}

struct CollectibleImage_Previews: PreviewProvider {
  static var previews: some View {
    CollectibleImage(item: CollectibleItem.bugSample, background: "fond_violet")
  }
}
