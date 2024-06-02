//
//  BugDetails.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 13/12/2022.
//

import SwiftUI

struct BugDetails: View {
  @EnvironmentObject var viewModel: UserViewModel
  @State private var showAlert = false
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
            isCollected: .constant(viewModel.contains(bug)),
            setImage: "leaf.fill",
            unsetImage: "leaf",
            setColor: Colors.green100,
            updateCollection: {
              if viewModel.isUserLoggedIn {
                Task {
                  if viewModel.contains(bug) {
                    viewModel.remove(bug)
                    await viewModel.updateBugCollection(with: bug.itemNumber)
                  } else {
                    viewModel.add(bug)
                    await viewModel.updateBugCollection(with: bug.itemNumber)
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
}

struct BugDetails_Previews: PreviewProvider {
  static var previews: some View {
    BugDetails(
      bug: CollectibleItem.bugSample
    )
  }
}
