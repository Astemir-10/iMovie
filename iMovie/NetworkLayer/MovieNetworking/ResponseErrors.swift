//
//  ResponseErrors.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 27.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

public enum ResponseErrors: String {
  case authorizationError   = "You need to be authorizated first."
   case unableToDecode       = "We could not do decode the response."
   case badReauest           = "Bad Request."
   case outdated             = "The url you requested is outdated."
   case noData               = "Response returned with no data to decode."
   case failed               = "Network request failed."
   case success
}
