//
//  SeaImage.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/12/2022.
//

import SwiftUI

struct SeaImage: View {
  var sea: SeaCreature
  
  var body: some View {
    AsyncImage(url: URL(string: sea.iconURI)) { image in
      image
        .resizable()
        .scaledToFit()
        .background(Image("fond"))
        .frame(maxWidth: .infinity)
        .clipShape(Rectangle())
        .overlay {
          Rectangle().stroke(Colors.blue200, lineWidth: 2)
        }
    } placeholder: {
      ProgressView()
    }
    .aspectRatio(2, contentMode: .fit)
  }
}

struct SeaImage_Previews: PreviewProvider {
  static var previews: some View {
    SeaImage(sea: SeaCreature.sample)
  }
}

