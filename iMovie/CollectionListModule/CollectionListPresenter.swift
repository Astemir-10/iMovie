//
//  CollectionListPresenter.swift
//  iMovie
//
//  Created by Astemir Shibzuhov on 29.08.2020.
//  Copyright © 2020 Astemir Shibzuhov. All rights reserved.
//

import Foundation

protocol CollectionListPresenterType: class  {
  var router: CollectionListRouterType! {get set}
  func configureView()
}

class CollectionListPresenter: CollectionListPresenterType {
  weak var view: CollectionListViewProtocol!
  var interactor: CollectionListInteractorType!
  var router: CollectionListRouterType!
  
  func configureView() {
    
  }
  
  init(view: CollectionListViewProtocol) {
    self.view = view
  }
}
