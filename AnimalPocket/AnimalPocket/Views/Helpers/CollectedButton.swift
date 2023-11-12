//
//  CollectedButton.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 17/02/2023.
//

import SwiftUI

struct CollectedButton: View {
  @Binding var isCollected: Bool
  var setImage: String
  var unsetImage: String
  var setColor: Color
  var updateCollection: () -> Void
  
  var body: some View {
    Button {
      isCollected.toggle()
      updateCollection()
    } label: {
      Label("Toggle Collected", systemImage: isCollected ? setImage : unsetImage)
        .labelStyle(.iconOnly)
        .foregroundColor(isCollected ? setColor : .gray)
    }
  }
}

//struct CollectedButton_Previews: PreviewProvider {
//  static var previews: some View {
//    CollectedButton(
//      isCollected: .constant(true),
//      setImage: "leaf.fill",
//      unsetImage: "leaf",
//      setColor: .green,
//      updateCollection: <#T##() -> ()#>
//    )
//  }
//}
