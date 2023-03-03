//
//  CollectedButton.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 17/02/2023.
//

import SwiftUI

struct CollectedButton: View {
  @Binding var isSet: Bool
  var setImage: String
  var unsetImage: String
  var setColor: Color
  
  var body: some View {
    Button {
      isSet.toggle()
    } label: {
      Label("Toggle Collected", systemImage: isSet ? setImage : unsetImage)
        .labelStyle(.iconOnly)
        .foregroundColor(isSet ? setColor : .gray)
    }
  }
}
