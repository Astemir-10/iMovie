//
//  DetailRouter.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 31.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol DetailRouterType: class {
  
}

class DetailRouter: DetailRouterType {
  weak var viewController: DetailViewController!
  
  init(viewController: DetailViewController) {
    self.viewController = viewController
  }
}
