//
//  AnimalPocketApp.swift
//  AnimalPocket
//
//  Created by Céline Barbe on 28/10/2022.
//

import SwiftUI

@main
struct AnimalPocketApp: App {
  // code below is to check font names
//  init(){
//      for family in UIFont.familyNames {
//           print(family)
//
//           for names in UIFont.fontNames(forFamilyName: family){
//           print("== \(names)")
//           }
//      }
//  }
  
    var body: some Scene {
        WindowGroup {
            HomePage()
        }
    }
}
