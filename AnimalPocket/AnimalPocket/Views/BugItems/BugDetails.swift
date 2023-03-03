//
//  BugDetails.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/12/2022.
//

import SwiftUI

struct BugDetails: View {
  @ObservedObject var viewModel = BugsViewModel()
  var bug: CollectibleItem
  
  var bugIndex: Int {
    viewModel.bugsArray.firstIndex(where: { $0.itemNumber == bug.itemNumber }) ?? 404
  }
  
  var body: some View {
    VStack {
      CollectibleImage(item: self.bug, background: "fond")
      
      HStack {
        Text(self.bug.name.nameEUfr)
          .font(.system(size: 15))
          .bold()
        
        
        CollectedButton(isSet: $viewModel.bugsArray[bugIndex].isCollected,
                        setImage: "ant.circle.fill",
                        unsetImage: "ant.circle",
                        setColor: Colors.green100
        )
      }
      .padding(.bottom, 0.5)
      
      // VStack below should go into a separate "item description" component
      VStack(alignment: .leading) {
        HStack {
          Text("Période:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(self.bug.availability.period)
        }
        
        HStack {
          Text("Heure:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(self.bug.availability.hour)
        }
        
        HStack {
          Text("Lieu:")
            .foregroundColor(Colors.green100)
            .bold()
          Text(self.bug.availability.location ?? "")
        }
        
        HStack {
          Text("Prix:")
            .foregroundColor(Colors.green100)
            .bold()
          Text("\(self.bug.price) clochettes")
        }
        
        RarityBadge(rarity: RarityViewModel(rarityLevel: bug.availability.rarity ?? .common))
      }
      .font(.system(size: 11))
      .padding(.bottom, 5)
    }
    .frame(width: 175)
    .background(Colors.green100.opacity(0.1))
    .cornerRadius(4)
  }
}

//struct BugDetails_Previews: PreviewProvider {
//  static let viewModel = BugsViewModel()
//  
//  static var previews: some View {
//    BugDetails(viewModel: viewModel, bug: viewModel.bugsArray[0])
//  }
//}
