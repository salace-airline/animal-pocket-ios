//
//  SeaDetails.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/12/2022.
//

import SwiftUI

struct SeaDetails: View {
  @EnvironmentObject var collection: CollectionViewModel
  @EnvironmentObject var user: LoginViewModel
  var sea: CollectibleItem
  
  var body: some View {
    VStack(alignment: .leading) {
      VStack {
        CollectibleImage(item: sea, background: "fond_violet")
        
        HStack {
          Text(sea.name.capitalized)
            .font(.system(size: 15))
            .bold()
          
          CollectedButton(
            isCollected: .constant(collection.contains(sea) && user.containsSeaCreature(sea.itemNumber)),
            setImage: "drop.fill",
            unsetImage: "drop",
            setColor: .black,
            updateCollection: {
              if user.isUserLoggedIn == true {
                Task {
                  if collection.contains(sea) {
                    collection.remove(sea)
                    await collection.updateSeaCollection(with: sea.itemNumber)
                  } else {
                    collection.add(sea)
                    await collection.updateSeaCollection(with: sea.itemNumber)
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
            Text("Shadow:")
          }
          HStack {
            Text("Speed:")
          }
          HStack {
            Text("Price:")
          }
        }
        .foregroundColor(Colors.blue200)
        .bold()
        
        
        VStack(alignment: .leading) {
          HStack {
            Text(sea.period)
          }
          
          HStack {
            Text(sea.hour)
          }
          
          HStack {
            Text(sea.shadow ?? "")
          }
          
          HStack {
            Text(sea.speed ?? "")
          }
          
          HStack {
            Text("\(sea.price) bells")
          }
        }
      }
      .padding(.leading, 10)
      
      .font(.system(size: 11))
      .padding(
        EdgeInsets(
          top: 0,
          leading: 10,
          bottom: 10,
          trailing: 0
        )
      )
    }
    .frame(width: 175)
    .background(Colors.blue200.opacity(0.1))
    .cornerRadius(4)
  }
}


struct SeaDetails_Previews: PreviewProvider {
  static var previews: some View {
    SeaDetails(
      sea: CollectibleItem.seaSample
    )
  }
}
