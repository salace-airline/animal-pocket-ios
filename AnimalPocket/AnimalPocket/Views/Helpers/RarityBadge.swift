//
//  RarityBadge.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 29/12/2022.
//

import SwiftUI

struct RarityBadge: View {
  @ObservedObject var rarity: RarityViewModel
  
  var body: some View {
    HStack {
      switch rarity.rarityLevel {
        case .common:
          Text("")
            .padding(2)
        case .uncommon:
          Text(" Uncommon ")
            .padding(2)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .background(Colors.green100)
            .cornerRadius(4)
        case .rare:
          Text(" Rare ")
            .padding(2)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .background(Color.orange)
            .cornerRadius(4)
        case .ultraRare:
          Text(" Very Rare ")
            .padding(2)
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .background(Color.red)
            .cornerRadius(4)
      }
    }
  }
}

struct RarityBadge_Previews: PreviewProvider {
  static var previews: some View {
    RarityBadge(rarity: RarityViewModel(rarityLevel: .rare))
  }
}
