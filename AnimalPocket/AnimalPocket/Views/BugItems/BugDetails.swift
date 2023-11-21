//
//  BugDetails.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/12/2022.
//

import SwiftUI

struct BugDetails: View {
  @EnvironmentObject var collection: CollectionViewModel
  @EnvironmentObject var user: LoginViewModel
  var bug: CollectibleItem
  
  var body: some View {
    VStack(alignment: .leading) {
      VStack {
        CollectibleImage(item: bug, background: "fond")
        
        HStack {
          Text(bug.name.capitalized)
            .font(.system(size: 15))
            .bold()
          
          CollectedButton(
            isCollected: .constant(user.containsBug(bug.itemNumber)),
            setImage: "leaf.fill",
            unsetImage: "leaf",
            setColor: .green,
            updateCollection: {
              if user.isUserLoggedIn == true {
                Task {
                  if collection.contains(bug) {
                    collection.remove(bug)
                    await collection.updateBugCollection(with: bug.itemNumber)
                  } else {
                    collection.add(bug)
                    await collection.updateBugCollection(with: bug.itemNumber)
                  }
                }
              } else {
                // alert to tell the user they need to login to update their collection
                print("You need to login first!")
              }
            }
          )
        }
        .padding(.bottom, 0.5)
      }
      
      HStack {
        VStack(alignment: .leading) {
          HStack {
            Text("Period:")
          }
          HStack {
            Text("Time:")
          }
          HStack {
            Text("Place:")
          }
          HStack {
            Text("Price:")
          }
        }
        .foregroundColor(Colors.green100)
        .bold()
        
        VStack(alignment: .leading) {
          HStack {
            Text(bug.period)
          }
          
          HStack {
            Text(bug.hour)
          }
          
          HStack {
            Text(bug.location ?? "")
          }
          
          HStack {
            Text("\(bug.price) bells")
          }
        }
      }
      .padding(.leading, 10)
      
      RarityBadge(rarity: RarityViewModel(
        rarityLevel: bug.rarity ?? .common)
      )
      .padding(
        EdgeInsets(
          top: 0,
          leading: 10,
          bottom: 10,
          trailing: 0
        )
      )
    }
    .font(.system(size: 11))
    .frame(width: 175)
    .background(Colors.green100.opacity(0.1))
    .cornerRadius(4)
  }
}

struct BugDetails_Previews: PreviewProvider {
  static var previews: some View {
    BugDetails(
      bug: CollectibleItem.bugSample
    )
  }
}
