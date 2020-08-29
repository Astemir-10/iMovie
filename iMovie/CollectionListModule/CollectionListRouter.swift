//
//  CollectionListRouter.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 29.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol CollectionListRouterType: class  {
  
}

class CollectionListRouter: CollectionListRouterType {
  weak var viewController: CollectionListViewProtocol!
  
  init(viewController: CollectionListViewProtocol) {
    self.viewController = viewController
  }
}
