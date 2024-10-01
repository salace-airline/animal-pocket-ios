//
//  CollectibleViewModel.swift
//  AnimalPocket
//
//  Created by Sarah WATREMET on 28/02/2023.
//

import Foundation

final class CollectibleViewModel: ObservableObject {
  @Published var bugsArray: [CollectibleItem] = []
  @Published var fishArray: [CollectibleItem] = []
  @Published var seaArray: [CollectibleItem] = []
  
  @Published var filter: Filter = .noFilter
  
  @Published var showCurrentItem = false
  @Published var showItemsOfTheMonth = false
  @Published var showAllItems = true
  
  @Published var noFilter = false
  @Published var increasingPrice = false
  @Published var decreasingPrice = false
  @Published var alphabeticalOrder = false
  
  @Published var showMissingBugs = false
  
  private var category: CategoryRouter
  
  init(category: CategoryRouter) {
    self.category = category
  }
  
  @MainActor
  func loadItems() {
    Task {
      switch category {
        case .fish:
          fishArray.append(contentsOf: try await CollectibleService.fetchCollectibles(path: category.path).map {
            CollectibleItem(
              itemNumber: $0.id,
              name: $0.name,
              monthNorthern: $0.monthNorthern,
              monthSouthern: $0.monthSouthern,
              monthArrayNorthern: $0.monthArrayNorthern,
              monthArraySouthern: $0.monthArraySouthern,
              availableTime: $0.availableTime,
              availableTimeArray: $0.availableTimeArray,
              isAllDay: $0.isAllDay,
              isAllYear: $0.isAllYear,
              location: $0.location,
              rarity: $0.rarity,
              speed: $0.speed,
              shadow: $0.shadow,
              price: $0.price,
              iconURI: $0.iconURI
            )
          })
        case .bug:
          bugsArray.append(contentsOf: try await CollectibleService.fetchCollectibles(path: category.path).map {
            CollectibleItem(
              itemNumber: $0.id,
              name: $0.name,
              monthNorthern: $0.monthNorthern,
              monthSouthern: $0.monthSouthern,
              monthArrayNorthern: $0.monthArrayNorthern,
              monthArraySouthern: $0.monthArraySouthern,
              availableTime: $0.availableTime,
              availableTimeArray: $0.availableTimeArray,
              isAllDay: $0.isAllDay,
              isAllYear: $0.isAllYear,
              location: $0.location,
              rarity: $0.rarity,
              speed: $0.speed,
              shadow: $0.shadow,
              price: $0.price,
              iconURI: $0.iconURI
            )
          })
        case .seaCreature:
          seaArray.append(contentsOf: try await CollectibleService.fetchCollectibles(path: category.path).map {
            CollectibleItem(
              itemNumber: $0.id,
              name: $0.name,
              monthNorthern: $0.monthNorthern,
              monthSouthern: $0.monthSouthern,
              monthArrayNorthern: $0.monthArrayNorthern,
              monthArraySouthern: $0.monthArraySouthern,
              availableTime: $0.availableTime,
              availableTimeArray: $0.availableTimeArray,
              isAllDay: $0.isAllDay,
              isAllYear: $0.isAllYear,
              location: $0.location,
              rarity: $0.rarity,
              speed: $0.speed,
              shadow: $0.shadow,
              price: $0.price,
              iconURI: $0.iconURI
            )
          })
      }
    }
  }
}

/// MARK -  Month & currently available filters
extension CollectibleViewModel {
  func filterCurrentMonth(for items: [CollectibleItem]) -> [CollectibleItem] {
    var currentItems: [CollectibleItem] = []
    for item in items {
      for month in item.monthArrayNorthern {
        if month == item.currentMonth {
          currentItems.append(item)
        }
      }
    }
    return currentItems
  }

  func filterCurrentItems(for items: [CollectibleItem]) -> [CollectibleItem] {
    var currentItems: [CollectibleItem] = []
    for item in items {
      for time in item.availableTimeArray {
        if time == item.currentTime {
          for month in item.monthArrayNorthern {
            if month == item.currentMonth {
              currentItems.append(item)
            }
          }
        }
      }
    }
    return currentItems
  }
}

/// MARK - Handle filter logic for views
extension CollectibleViewModel {
  func filterItems(_ items: [CollectibleItem]) -> [CollectibleItem] {
    switch self.filter {
      case .noFilter:
        return items
      case .increasingPrice:
        return self.filter.increasePrice(of: items)
      case .decreasingPrice:
        return self.filter.decreasePrice(of: items)
      case .alphatically:
        return self.filter.sortAlphabetically(items)
    }
  }
}
