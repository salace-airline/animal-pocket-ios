//
//  BugImage.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/12/2022.
//

import SwiftUI

struct BugImage: View {
  var bug: Bug
  
  var body: some View {
    AsyncImage(url: URL(string: bug.iconURI)) { image in
      image
        .resizable()
        .scaledToFit()
        .background(Image("fond"))
        .frame(maxWidth: .infinity)
        .clipShape(Rectangle())
        .overlay {
          Rectangle().stroke(Colors.green100, lineWidth: 2)
        }
    } placeholder: {
      ProgressView()
    }
    .aspectRatio(2, contentMode: .fit)
  }
}

struct BugImage_Previews: PreviewProvider {
  static var previews: some View {
    BugImage(bug: Bug.sample)
  }
}
