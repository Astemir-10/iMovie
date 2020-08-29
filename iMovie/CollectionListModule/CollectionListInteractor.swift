//
//  CollectionListInteractor.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 29.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol CollectionListInteractorType: class {
  func requestData()
}

class CollectionListInteractor: CollectionListInteractorType {
  weak var presenter: CollectionListPresenterType!
  
  func requestData() {
    
  }
  
  init(presenter: CollectionListPresenterType) {
    self.presenter = presenter
  }
}
