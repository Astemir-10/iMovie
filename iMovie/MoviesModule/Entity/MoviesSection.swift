//
//  MoviesSection.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 26.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

enum SectionType {
  case popular
  case genre
  case topRaited
}

struct MoviesSection: Hashable {
  let name: String
  let type: SectionType
}
