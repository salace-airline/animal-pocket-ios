//
//  SliderToggleStyle.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 03/02/2023.
//

import SwiftUI

struct MinusToggleStyle: ToggleStyle {
  func makeBody(configuration: Configuration) -> some View {
    Button {
      configuration.isOn.toggle()
    } label: {
      Label {
        configuration.label
      } icon: {
        Image(systemName: configuration.isOn ? "minus" : "plus")
          .accessibility(label: Text(configuration.isOn ? "Selected" : "Unselected"))
          .imageScale(.large)
      }
    }
    .buttonStyle(PlainButtonStyle())
  }
}


