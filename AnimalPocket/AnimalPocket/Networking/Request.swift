//
//  Request.swift
//  AnimalPocket
//
//  Created by Sarah Watremet on 08/02/2023.
//

import Foundation

public protocol Request {
  func asURLRequest() throws -> URLRequest
}
