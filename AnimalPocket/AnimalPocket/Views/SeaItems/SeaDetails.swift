//
//  SeaDetails.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/12/2022.
//

import SwiftUI

struct SeaDetails: View {
  @EnvironmentObject var collection: CollectionViewModel
  @EnvironmentObject var user: UserViewModel
  @State private var showAlert = false
  var seaCreature: CollectibleItem
  
  var body: some View {
    VStack(alignment: .leading) {
      VStack {
        CollectibleImage(item: seaCreature, background: "fond_violet")
        
        HStack {
          Text(seaCreature.name.capitalized)
            .font(.system(size: 15))
            .bold()
          
          CollectedButton(
            isCollected: .constant(collection.contains(seaCreature)),
            setImage: "drop.fill",
            unsetImage: "drop",
            setColor: Colors.blueDark,
            updateCollection: {
              if user.isUserLoggedIn == true {
                Task {
                  if collection.contains(seaCreature) {
                    collection.remove(seaCreature)
                    await user.updateSeaCollection(with: seaCreature.itemNumber)
                  } else {
                    collection.add(seaCreature)
                    await user.updateSeaCollection(with: seaCreature.itemNumber)
                  }
                }
              } else {
                showAlert = true
              }
            }
          )
          .alert("You need to login first!", isPresented: $showAlert) {
            Button("OK", role: .cancel) { }
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
              Text(seaCreature.period)
            }
            
            HStack {
              Text(seaCreature.hour)
            }
            
            HStack {
              Text(seaCreature.shadow ?? "")
            }
            
            HStack {
              Text(seaCreature.speed ?? "")
            }
            
            HStack {
              Text("\(seaCreature.price) bells")
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
}


struct SeaDetails_Previews: PreviewProvider {
  static var previews: some View {
    SeaDetails(
      seaCreature: CollectibleItem.seaSample
    )
  }
}
