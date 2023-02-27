//
//  CollectedButton.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 17/02/2023.
//

import SwiftUI

struct CollectedButton: View {
  @State var isSet: Bool
  var setImage: String
  var unsetImage: String
  var setColor: Color
  var action: ()
  
  var body: some View {
    Button {
      isSet.toggle()
      action
    } label: {
      Label("Toggle Collected", systemImage: isSet ? setImage : unsetImage)
        .labelStyle(.iconOnly)
        .foregroundColor(isSet ? setColor : .gray)
    }
  }
}

//struct CollectedButton_Previews: PreviewProvider {
//  static var previews: some View {
//    CollectedButton(isSet: true,
//                    setImage: "ant.circle.fill",
//                    unsetImage: "ant.circle",
//                    setColor: Colors.green100
//    )
//  }
//}
